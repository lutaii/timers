part of create_timer;

class CreateTimerBloc extends Bloc<CreateTimerEvent, CreateTimerState> {
  CreateTimerBloc(
      ProjectsRepository projectsRepository, TimersRepository timersRepository)
      : _projectsRepository = projectsRepository,
        _timersRepository = timersRepository,
        super(CreateTimerInitialState()) {
    on<LoadProjectsEvent>(_onLoadProjectsEvent);
    on<ProjectUpdateEvent>(_onProjectUpdateEvent);
    on<TaskUpdateEvent>(_onTaskUpdateEvent);
    on<DescriptionUpdateEvent>(_onDescriptionUpdateEvent);
    on<FavoriteUpdateEvent>(_onFavoriteUpdateEvent);
    on<SaveTimerEvent>(_onSaveTimerEvent);
  }

  final ProjectsRepository _projectsRepository;
  final TimersRepository _timersRepository;

  late List<Project> _projects;

  void _onLoadProjectsEvent(
      LoadProjectsEvent event, Emitter<CreateTimerState> emit) {
    // mock request
    _projects = _projectsRepository.getProjects;
    final projectsTitles = _projects.map((project) => project.title).toList();
    emit(CreateTimerStateData(projectTitles: projectsTitles));
  }

  void _onProjectUpdateEvent(
      ProjectUpdateEvent event, Emitter<CreateTimerState> emit) {
    if (state is CreateTimerStateData) {
      final loadedState = state as CreateTimerStateData;
      final project =
          _projects.firstWhere((element) => element.title == event.project);
      emit(loadedState.copyWith(
        project: project,
        task: Task(title: ''),
      ));
    }
  }

  void _onTaskUpdateEvent(
      TaskUpdateEvent event, Emitter<CreateTimerState> emit) {
    if (state is CreateTimerStateData) {
      final loadedState = state as CreateTimerStateData;
      final task = loadedState.project?.tasks
          .firstWhere((element) => element.title == event.task);
      emit(loadedState.copyWith(task: task));
    }
  }

  void _onDescriptionUpdateEvent(
      DescriptionUpdateEvent event, Emitter<CreateTimerState> emit) {
    if (state is CreateTimerStateData) {
      final loadedState = state as CreateTimerStateData;
      emit(loadedState.copyWith(description: event.description));
    }
  }

  void _onFavoriteUpdateEvent(
      FavoriteUpdateEvent event, Emitter<CreateTimerState> emit) {
    if (state is CreateTimerStateData) {
      final loadedState = state as CreateTimerStateData;
      emit(loadedState.copyWith(isFavorite: event.isFavorite));
    }
  }

  void _onSaveTimerEvent(SaveTimerEvent event, Emitter<CreateTimerState> emit) {
    if (state is CreateTimerStateData) {
      final loadedState = state as CreateTimerStateData;
      final id = _timersRepository.getTimers.isEmpty
          ? 0
          : _timersRepository.getTimers.last.id + 1;
      if (loadedState.project != null && loadedState.task != null) {
        _timersRepository.addTimer(
          TimerModel(
            project: loadedState.project!,
            task: loadedState.task!,
            isFavorite: loadedState.isFavorite ?? false,
            description: loadedState.description ?? '',
            time: 30,
            id: id,
            duration: 20,
            initialDuration: 20,
            type: TimerType.pause,
          ),
        );
      }
    }
  }
}

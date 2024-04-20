part of timer_details;

class TimesheetBloc extends Bloc<TimesheetEvent, TimesheetState> {
  TimesheetBloc(TimersRepository timersRepository)
      : _timersRepository = timersRepository,
        super(TimersheetInitialState()) {
    on<TimesheetInitEvent>(_onInit);
    on<TimesheetUpdateEvent>(_onCompletedStreamListener);
    add(TimesheetInitEvent());
    add(TimesheetUpdateEvent());
  }

  final TimersRepository _timersRepository;

  List<TimerModel> timers = [];

  FutureOr<void> _onInit(event, Emitter<TimesheetState> emit) async {
    timers = _timersRepository.getTimers
        .where((timer) => timer.type == TimerType.completed)
        .toList();

    if (timers.isNotEmpty) {
      emit(TimesheetDataState(completedTimers: timers));
    } else {
      emit(TimersheetEmptyState());
    }
  }

  FutureOr<void> _onCompletedStreamListener(
      event, Emitter<TimesheetState> emit) async {
    await emit.forEach(_timersRepository.timersModelStream,
        onData: (TimerModel timer) {
      if (timer.type == TimerType.completed) {
        timers.add(timer);
      }
      return TimesheetDataState(completedTimers: timers);
    });
  }
}

part of create_timer;

class CreateTimerScreen extends StatelessWidget {
  CreateTimerScreen({super.key});

  final bloc =
      CreateTimerBloc(getIt<ProjectsRepository>(), getIt<TimersRepository>());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Create Timer',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: customGradient,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocProvider<CreateTimerBloc>(
                create: (context) => bloc..add(LoadProjectsEvent()),
                child: BlocBuilder<CreateTimerBloc, CreateTimerState>(
                  builder: (context, state) {
                    if (state is CreateTimerStateData) {
                      return Stack(
                        children: [
                          ListView(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomDropDown(
                                    title: state.project?.title ?? 'Project',
                                    items: state.projectTitles,
                                    onTap: (project) => bloc.add(
                                        ProjectUpdateEvent(project: project)),
                                  ),
                                  const SizedBox(height: 28),
                                  IgnorePointer(
                                    ignoring: state.project == null,
                                    child: Opacity(
                                      opacity: state.project == null ? 0.5 : 1,
                                      child: CustomDropDown(
                                        title: state.task?.title == ''
                                            ? 'Task'
                                            : state.task?.title ?? 'Task',
                                        items: state.project?.tasks
                                                .map((task) => task.title ?? '')
                                                .toList() ??
                                            [],
                                        onTap: (task) => bloc
                                            .add(TaskUpdateEvent(task: task)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 28),
                                  SizedBox(
                                    child: IgnorePointer(
                                      ignoring: state.task == null ||
                                          state.task?.title == '',
                                      child: Opacity(
                                        opacity: state.task == null ||
                                                state.task?.title == ''
                                            ? 0.5
                                            : 1,
                                        child: TextField(
                                          onTapOutside: (event) {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          onChanged: (value) {
                                            bloc.add(DescriptionUpdateEvent(
                                                description: value));
                                          },
                                          minLines: 1,
                                          maxLines: 5,
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText: 'Description',
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .outline,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                            border: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Opacity(
                                    opacity: state.task == null ||
                                            state.task?.title == ''
                                        ? 0.5
                                        : 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        IgnorePointer(
                                          ignoring: state.task == null ||
                                              state.task?.title == '',
                                          child: Checkbox(
                                            value: state.isFavorite ?? false,
                                            onChanged: (bool? value) {
                                              bloc.add(
                                                FavoriteUpdateEvent(
                                                    isFavorite: value ?? false),
                                              );
                                            },
                                          ),
                                        ),
                                        Text(
                                          'Make Favorite',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 80),
                                ],
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: IgnorePointer(
                              ignoring:
                                  state.task == null || state.task?.title == '',
                              child: Opacity(
                                opacity: state.task == null ||
                                        state.task?.title == ''
                                    ? 0.5
                                    : 1,
                                child: CreateButtonWidget(
                                  onTap: () {
                                    bloc.add(SaveTimerEvent());
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

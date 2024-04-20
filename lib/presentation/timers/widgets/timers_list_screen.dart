part of timers;

class TimersListScreen extends StatelessWidget {
  TimersListScreen({super.key});

  final timersListBloc = TimersListBloc(getIt<TimersRepository>());
  final timersManagerBloc = getIt<TimerBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => timersListBloc,
        ),
        BlocProvider(
          create: (context) => timersManagerBloc,
        ),
      ],
      child: BlocBuilder<TimersListBloc, TimersListState>(
        builder: (context, state) {
          if (state is TimersListDataState) {
            if (state.timers.isNotEmpty) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: HomeScreenAppBar(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(
                            'You have ${state.timers.length} Timer(s)',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        BlocBuilder<TimerBloc, TimerState>(
                          builder: (context, timersState) {
                            return Column(
                              children: state.timers
                                  .map((timer) {
                                    final selectedTimer = timersState.timers
                                        .firstWhereOrNull((element) =>
                                            element.id == timer.id);
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 8,
                                        left: 16,
                                        right: 16,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            '/details',
                                            arguments: timer,
                                          );
                                        },
                                        child: CustomContainer(
                                          child: TimerWidget(
                                            task: timer.task.title ?? '',
                                            project: timer.project.title,
                                            deadline: 'Tomorrow',
                                            isFavorite: timer.isFavorite,
                                            type: selectedTimer?.type ??
                                                TimerType.completed,
                                            id: timer.id,
                                            duration:
                                                selectedTimer?.duration ?? 0,
                                            onTap: () {
                                              selectedTimer?.type ==
                                                      TimerType.running
                                                  ? timersManagerBloc.add(
                                                      TimerPaused(
                                                        id: timer.id,
                                                        duration: selectedTimer
                                                                ?.duration ??
                                                            0,
                                                      ),
                                                    )
                                                  : timersManagerBloc
                                                      .add(TimerResumed(
                                                      duration: selectedTimer
                                                              ?.duration ??
                                                          0,
                                                      id: timer.id,
                                                    ));
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                                  .toList()
                                  .reversed
                                  .toList(),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              );
            } else {
              return const EmptyWidget();
            }
          } else {
            return const EmptyWidget();
          }
        },
      ),
    );
  }
}

part of timer_details;

class TimesheetWidget extends StatelessWidget {
  const TimesheetWidget({
    super.key,
    required this.timer,
  });

  final TimerModel timer;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider.value(
          value: getIt<TimerBloc>(),
          child: BlocBuilder<TimerBloc, TimerState>(
            builder: (context, state) {
              final duration = state.timers
                  .firstWhere((element) => element.id == timer.id)
                  .duration;

              final type = state.timers
                  .firstWhere((element) => element.id == timer.id)
                  .type;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        type == TimerType.completed
                            ? const SizedBox.shrink()
                            : TimsheetTileWidget(
                                type: type,
                                timer: timer,
                                duration: duration,
                              ),
                        const SizedBox(height: 16),
                      ],
                    ),
                    BlocProvider(
                      create: (context) =>
                          TimesheetBloc(getIt<TimersRepository>()),
                      child: BlocBuilder<TimesheetBloc, TimesheetState>(
                        builder: (context, historyState) {
                          if (historyState is TimesheetDataState) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                historyState.completedTimers.isEmpty
                                    ? const SizedBox.shrink()
                                    : Text(
                                        'Completed Records',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                SizedBox(
                                  height:
                                      timer.type == TimerType.completed ? 0 : 8,
                                ),
                                Column(
                                  children: historyState.completedTimers
                                      .map(
                                        (completedTimer) => Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: TimsheetTileWidget(
                                            timer: completedTimer,
                                            type: TimerType.completed,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                )
                              ],
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}

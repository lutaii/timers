part of timer_details;

class TimsheetTileWidget extends StatelessWidget {
  const TimsheetTileWidget({
    super.key,
    required this.timer,
    this.duration,
    this.type,
  });

  final TimerType? type;
  final TimerModel timer;
  final int? duration;

  @override
  Widget build(BuildContext context) {
    int minutesInitial = timer.initialDuration ~/ 60;
    int remainingSecondsInitial = timer.initialDuration % 60;
    final String durationInitString =
        '${minutesInitial.toString().padLeft(2, '0')}:${remainingSecondsInitial.toString().padLeft(2, '0')}';

    int minutes = (duration ?? 0) ~/ 60;
    int remainingSeconds = (duration ?? 0) % 60;
    final String durationString =
        '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              type == TimerType.completed
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SvgPicture.asset(
                        'assets/svg/done_ic.svg',
                      ),
                    )
                  : const SizedBox.shrink(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Monday',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '17.07.2023',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Start Time 10:00',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const Spacer(),
              type == TimerType.completed
                  ? Container(
                      height: 32,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(64),
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      child: Center(
                        child: Text(
                          durationInitString,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          const SizedBox(height: 4),
          type != TimerType.completed
              ? Row(
                  children: [
                    Text(
                      durationString,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        getIt<TimerBloc>().add(TimerFinished(id: timer.id));
                      },
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(64),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svg/stop_ic.svg',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        type == TimerType.running
                            ? getIt<TimerBloc>().add(TimerPaused(
                                id: timer.id,
                                duration: duration ?? timer.duration))
                            : getIt<TimerBloc>().add(TimerResumed(
                                id: timer.id,
                                duration: duration ?? timer.duration));
                      },
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: type == TimerType.running
                              ? Theme.of(context).colorScheme.primaryContainer
                              : Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                          borderRadius: BorderRadius.circular(64),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            type == TimerType.pause
                                ? 'assets/svg/play_ic.svg'
                                : 'assets/svg/pause_ic.svg',
                            colorFilter: ColorFilter.mode(
                              type == TimerType.pause
                                  ? Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer
                                  : Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          timer.description == ''
              ? const SizedBox.shrink()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Divider(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      timer.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

part of timers;

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    super.key,
    required this.task,
    required this.project,
    required this.deadline,
    required this.isFavorite,
    required this.type,
    required this.id,
    required this.onTap,
    required this.duration,
  });

  final String task;
  final String project;
  final String deadline;
  final bool isFavorite;
  final TimerType type;
  final int id;
  final VoidCallback onTap;
  final int duration;

  @override
  Widget build(BuildContext context) {
    int minutes = duration ~/ 60;
    int remainingSeconds = duration % 60;
    final String durationString =
        '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 2,
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFFFC629),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              children: [
                DescriptionWidget(
                  isFavorite
                      ? 'assets/svg/star_filled_ic.svg'
                      : 'assets/svg/star_ic.svg',
                  text: task,
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                DescriptionWidget(
                  'assets/svg/project_ic.svg',
                  text: project,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                DescriptionWidget(
                  'assets/svg/deadline_ic.svg',
                  text: deadline,
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 104,
              height: 48,
              decoration: BoxDecoration(
                color: type == TimerType.running
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(64),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      durationString,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: type == TimerType.running
                              ? Theme.of(context).colorScheme.onPrimaryContainer
                              : Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset(
                      type == TimerType.running
                          ? 'assets/svg/pause_ic.svg'
                          : 'assets/svg/play_ic.svg',
                      height: 15,
                      colorFilter: ColorFilter.mode(
                        type == TimerType.running
                            ? Theme.of(context).colorScheme.onPrimaryContainer
                            : Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget(this.svgAsset,
      {super.key, required this.text, this.textStyle});

  final String svgAsset;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 4,
          ),
          child: SvgPicture.asset(
            svgAsset,
            width: 15,
          ),
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ],
    );
  }
}

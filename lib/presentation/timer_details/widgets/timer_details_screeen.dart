part of timer_details;

class TimerDetailsScreen extends StatelessWidget {
  const TimerDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TimerModel timer =
        ModalRoute.of(context)!.settings.arguments as TimerModel;

    return Material(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            timer.task.title ?? '',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          bottom: TabBar(
            labelStyle: Theme.of(context).textTheme.labelLarge,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 2.0),
            ),
            tabs: const [
              Tab(
                text: 'Timesheets',
              ),
              Tab(
                text: 'Details',
              )
            ],
          ),
          backgroundColor: Colors.transparent,
        ),
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: customGradient,
          ),
          child: TabBarView(
            children: [
              TimesheetWidget(timer: timer),
              DescriptionWidget(timer: timer),
            ],
          ),
        ),
      ),
    ));
  }
}

part of timer_details;

abstract class TimesheetState {}

class TimersheetInitialState extends TimesheetState {}

class TimesheetDataState extends TimesheetState {
  final List<TimerModel> completedTimers;

  TimesheetDataState({required this.completedTimers});
}

class TimersheetEmptyState extends TimesheetState {}

part of timers;

abstract class TimersListState {}

class TimersListInitialState extends TimersListState {}

class TimersListEmptyState extends TimersListState {}

class TimersListDataState extends TimersListState {
  List<TimerModel> timers;
  TimersListDataState({
    required this.timers,
  });
}

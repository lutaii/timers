part of timers;

sealed class TimerState {
  final List<TimerModel> timers;

  TimerState(this.timers);
}

final class TimerInitial extends TimerState {
  TimerInitial(super.timers);
}

final class TimerRunPause extends TimerState {
  TimerRunPause(super.timers);
}

final class TimerRunInProgress extends TimerState {
  TimerRunInProgress(super.timers);
}

final class TimerRunComplete extends TimerState {
  TimerRunComplete(super.timers);
}

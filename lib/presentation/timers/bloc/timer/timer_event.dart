part of timers;

sealed class TimerEvent {
  const TimerEvent();
}

final class TimerStarted extends TimerEvent {
  const TimerStarted({
    required this.duration,
    required this.id,
  });
  final int duration;
  final int id;
}

final class TimerPaused extends TimerEvent {
  const TimerPaused({required this.id, required this.duration});
  final int id;
  final int duration;
}

final class TimerResumed extends TimerEvent {
  const TimerResumed({required this.id, required this.duration});
  final int id;
  final int duration;
}

class TimerFinished extends TimerEvent {
  const TimerFinished({required this.id});
  final int id;
}

class TimerTicked extends TimerEvent {
  const TimerTicked({
    required this.id,
    required this.duration,
  });
  final int duration;
  final int id;
}

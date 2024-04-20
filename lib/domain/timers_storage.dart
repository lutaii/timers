import 'package:timers/domain/timer_model.dart';

class TimersStorage {
  final List<TimerModel> _timers = [];

  List<TimerModel> get getTimers => _timers;

  void addTimer(TimerModel timer) {
    _timers.add(timer);
  }

  void updateTimer(TimerModel timer) {
    final index = _timers.indexWhere((element) => element.id == timer.id);
    _timers[index] = timer;
  }
}

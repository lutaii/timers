import 'dart:async';

import 'package:timers/domain/timer_model.dart';
import 'package:timers/domain/timer_type.dart';
import 'package:timers/domain/timers_storage.dart';

abstract class TimersRepository {
  void addTimer(TimerModel timer);

  List<TimerModel> get getTimers;

  Stream<TimerModel> get timersModelStream;

  void dispose();
}

class TimerRepositoryImpl implements TimersRepository {
  TimerRepositoryImpl({required this.timerStorage});

  final TimersStorage timerStorage;

  final StreamController<TimerModel> _timersStreamController =
      StreamController.broadcast();

  @override
  void addTimer(TimerModel timer) {
    if (timer.type != TimerType.completed) {
      timerStorage.addTimer(timer);
    } else {
      timerStorage.updateTimer(timer);
    }
    _timersStreamController.add(timer);
  }

  @override
  List<TimerModel> get getTimers => timerStorage.getTimers;

  @override
  Stream<TimerModel> get timersModelStream => _timersStreamController.stream;

  @override
  void dispose() {
    _timersStreamController.close();
  }
}

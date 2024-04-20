import 'package:timers/domain/project.dart';
import 'package:timers/domain/task.dart';
import 'package:timers/domain/timer_type.dart';

class TimerModel {
  final Project project;
  final Task task;
  final bool isFavorite;
  final int time;
  final String description;
  final int id;
  final int duration;
  final int initialDuration;
  final TimerType type;

  TimerModel({
    required this.project,
    required this.task,
    required this.isFavorite,
    required this.time,
    required this.description,
    required this.id,
    required this.duration,
    required this.type,
    required this.initialDuration,
  });

  TimerModel copyWith({
    Project? project,
    Task? task,
    bool? isFavorite,
    int? time,
    String? description,
    int? id,
    int? duration,
    int? initialDuration,
    TimerType? type,
  }) {
    return TimerModel(
      project: project ?? this.project,
      task: task ?? this.task,
      isFavorite: isFavorite ?? this.isFavorite,
      time: time ?? this.time,
      description: description ?? this.description,
      id: id ?? this.id,
      duration: duration ?? this.duration,
      type: type ?? this.type,
      initialDuration: initialDuration ?? this.initialDuration,
    );
  }
}

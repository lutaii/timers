import 'package:timers/domain/task.dart';

class Project {
  final String title;
  final List<Task> tasks;

  Project({
    required this.title,
    required this.tasks,
  });
}

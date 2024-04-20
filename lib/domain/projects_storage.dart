import 'package:timers/domain/project.dart';
import 'package:timers/domain/task.dart';

class ProjectsStorage {
  final List<Project> projects;

  ProjectsStorage({required this.projects});
}

final storageMock = ProjectsStorage(projects: [
  Project(
    title: 'Witcher 4',
    tasks: [
      Task(
        title: 'Fix Bugs',
        deadline: DateTime.now().add(const Duration(days: 2)),
        assignedTo: 'Ivan',
      ),
      Task(
        title: 'DLC',
        deadline: DateTime.now().add(const Duration(days: 2)),
        assignedTo: 'Ivan',
      ),
      Task(
        title: 'Level Design',
        deadline: DateTime.now().add(const Duration(days: 2)),
        assignedTo: 'Ivan',
      ),
      Task(
        title: 'Posters',
        deadline: DateTime.now().add(const Duration(days: 2)),
        assignedTo: 'Ivan',
      ),
      Task(
        title: 'Engine Development',
        deadline: DateTime.now().add(const Duration(days: 2)),
        assignedTo: 'Ivan',
      ),
      Task(
        title: 'Write new quest dialogs',
        deadline: DateTime.now().add(const Duration(days: 2)),
        assignedTo: 'Ivan',
      ),
    ],
  ),
  Project(
    title: 'Cyberpunk p2',
    tasks: [
      Task(
        title: 'Fix Bugs',
        deadline: DateTime.now().add(const Duration(days: 2)),
        assignedTo: 'Ivan',
      ),
      Task(
        title: 'Level Design',
        deadline: DateTime.now().add(const Duration(days: 2)),
        assignedTo: 'Ivan',
      ),
      Task(
        title: 'Posters',
        deadline: DateTime.now().add(const Duration(days: 2)),
        assignedTo: 'Ivan',
      ),
      Task(
        title: 'Engine Development',
        deadline: DateTime.now().add(const Duration(days: 2)),
        assignedTo: 'Ivan',
      ),
    ],
  ),
  Project(
    title: 'Last of Us p3',
    tasks: [
      Task(
        title: 'Fix Bugs',
        deadline: DateTime.now().add(const Duration(days: 2)),
        assignedTo: 'Ivan',
      ),
      Task(
        title: 'Level Design',
        deadline: DateTime.now().add(const Duration(days: 2)),
        assignedTo: 'Ivan',
      ),
      Task(
        title: 'Posters',
        deadline: DateTime.now().add(const Duration(days: 2)),
        assignedTo: 'Ivan',
      ),
      Task(
        title: 'Audio',
        deadline: DateTime.now().add(const Duration(days: 2)),
        assignedTo: 'Ivan',
      ),
      Task(
        title: 'Dialogs',
        deadline: DateTime.now().add(const Duration(days: 2)),
        assignedTo: 'Ivan',
      ),
    ],
  )
]);

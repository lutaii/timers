part of create_timer;

abstract class CreateTimerState {}

class CreateTimerInitialState extends CreateTimerState {}

class CreateTimerStateData extends CreateTimerState {
  final Project? project;
  final Task? task;
  final bool? isFavorite;
  final String? description;
  final List<String> projectTitles;

  CreateTimerStateData({
    required this.projectTitles,
    this.project,
    this.task,
    this.isFavorite,
    this.description,
  });

  CreateTimerStateData copyWith({
    Project? project,
    Task? task,
    bool? isFavorite,
    String? description,
    List<String>? projectTitles,
  }) {
    return CreateTimerStateData(
      projectTitles: projectTitles ?? this.projectTitles,
      project: project ?? this.project,
      task: task ?? this.task,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

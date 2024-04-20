part of create_timer;

abstract class CreateTimerEvent {}

class CreateTimerInitialEvent extends CreateTimerEvent {}

class LoadProjectsEvent extends CreateTimerEvent {}

class ProjectUpdateEvent extends CreateTimerEvent {
  ProjectUpdateEvent({required this.project});
  final String project;
}

class TaskUpdateEvent extends CreateTimerEvent {
  TaskUpdateEvent({required this.task});
  final String task;
}

class DescriptionUpdateEvent extends CreateTimerEvent {
  DescriptionUpdateEvent({required this.description});
  final String description;
}

class FavoriteUpdateEvent extends CreateTimerEvent {
  FavoriteUpdateEvent({required this.isFavorite});
  final bool isFavorite;
}

class SaveTimerEvent extends CreateTimerEvent {}

import 'package:timers/domain/project.dart';
import 'package:timers/domain/projects_storage.dart';

abstract class ProjectsRepository {
  List<Project> get getProjects;
}

class ProjectsRepositoryImpl implements ProjectsRepository {
  ProjectsRepositoryImpl({required ProjectsStorage storage})
      : _storage = storage;

  final ProjectsStorage _storage;

  @override
  List<Project> get getProjects => _storage.projects;
}

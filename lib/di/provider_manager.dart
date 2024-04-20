import 'package:get_it/get_it.dart';
import 'package:timers/data/projects_repository.dart';
import 'package:timers/data/timer_repository.dart';
import 'package:timers/domain/projects_storage.dart';
import 'package:timers/domain/timers_storage.dart';
import 'package:timers/presentation/timers/timers.dart';
import 'package:timers/presentation/utils/ticker.dart';

final GetIt getIt = GetIt.asNewInstance();

class ProviderManager {
  void configureDependencies(
    GetIt getIt,
  ) {
    registerProjectsRepository(getIt);
    registerTimersRepository(getIt);
    registerTimerBloc(getIt);
  }

  void registerProjectsRepository(GetIt getIt) {
    getIt.registerSingleton<ProjectsRepository>(
      ProjectsRepositoryImpl(storage: storageMock),
    );
  }

  void registerTimersRepository(GetIt getIt) {
    getIt.registerSingleton<TimersRepository>(
        TimerRepositoryImpl(timerStorage: TimersStorage()), dispose: (repo) {
      repo.dispose();
    });
  }

  void registerTimerBloc(GetIt getIt) {
    getIt.registerSingleton<TimerBloc>(
      TimerBloc(
        ticker: const Ticker(),
        timersRepository: getIt<TimersRepository>(),
      ),
      dispose: (bloc) => bloc.close(),
    );
  }
}

part of timers;

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc({
    required Ticker ticker,
    required TimersRepository timersRepository,
  })  : _ticker = ticker,
        _timersRepository = timersRepository,
        super(TimerInitial(timersRepository.getTimers)) {
    on<TimerPaused>(_onPaused);
    on<TimerResumed>(_onResumed);
    on<TimerTicked>(_onTicked);
    on<TimerFinished>(_onTimerFinished);
  }

  final Ticker _ticker;

  final TimersRepository _timersRepository;

  Map<int, StreamSubscription<int>> subscriptionsSet = {};

  @override
  Future<void> close() {
    for (var sub in subscriptionsSet.entries) {
      sub.value.cancel();
    }
    return super.close();
  }

  void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
    if (state is TimerRunInProgress) {
      final index =
          state.timers.indexWhere((element) => element.id == event.id);
      subscriptionsSet[event.id]?.pause();
      state.timers[index] = state.timers[index].copyWith(type: TimerType.pause);

      emit(TimerRunPause(state.timers));
    }
  }

  void _onResumed(TimerResumed resume, Emitter<TimerState> emit) {
    final index = state.timers.indexWhere((element) => element.id == resume.id);
    state.timers[index] = state.timers[index].copyWith(type: TimerType.running);
    emit(TimerRunInProgress(state.timers));

    subscriptionsSet[resume.id]?.cancel();
    subscriptionsSet[resume.id] =
        _ticker.tick(ticks: resume.duration).listen((duration) {
      add(TimerTicked(duration: duration, id: resume.id));
    });
  }

  void _onTicked(TimerTicked event, Emitter<TimerState> emit) {
    if (event.duration > 0) {
      final index =
          state.timers.indexWhere((element) => element.id == event.id);
      state.timers[index] =
          state.timers[index].copyWith(duration: event.duration);
      emit(TimerRunInProgress(state.timers));
    } else {
      add(TimerFinished(id: event.id));
    }
  }

  void _onTimerFinished(TimerFinished event, Emitter<TimerState> emit) {
    final index = state.timers.indexWhere((element) => element.id == event.id);
    state.timers[index] =
        state.timers[index].copyWith(type: TimerType.completed);
    _timersRepository.addTimer(state.timers[index]);
    subscriptionsSet[event.id]?.cancel();
    emit(TimerRunComplete(state.timers));
  }
}

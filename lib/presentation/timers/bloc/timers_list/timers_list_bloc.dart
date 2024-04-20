part of timers;

class TimersListBloc extends Bloc<TimersListEvent, TimersListState> {
  TimersListBloc(TimersRepository timersRepository)
      : _timersRepository = timersRepository,
        super(TimersListInitialState()) {
    on<GetTimersEvent>(_onInitStreamListener);
    add(GetTimersEvent());
  }

  final TimersRepository _timersRepository;

  final List<TimerModel> timers = [];

  FutureOr<void> _onInitStreamListener(
      event, Emitter<TimersListState> emit) async {
    await emit.forEach(_timersRepository.timersModelStream,
        onData: (TimerModel timer) {
      if (timer.type == TimerType.completed) {
        timers.removeWhere((element) => element.id == timer.id);
      } else {
        timers.add(timer);
      }
      return TimersListDataState(timers: timers);
    });
  }
}

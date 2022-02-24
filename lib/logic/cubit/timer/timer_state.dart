part of 'timer_cubit.dart';

enum TimerStatus { run, end }

class TimerState extends Equatable {

  final TimerStatus timerStatus;
  const TimerState({
    this.timerStatus = TimerStatus.run,
  });



  @override
  List<Object> get props => [ timerStatus];

  TimerState copyWith({
    int? duration,
    TimerStatus? timerStatus,
  }) {
    return TimerState(
      timerStatus: timerStatus ?? this.timerStatus,
    );
  }
}

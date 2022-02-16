part of 'timer_cubit.dart';

enum TimerStatus { initial, run, end }

class TimerState extends Equatable {

  final TimerStatus timerStatus;
  const TimerState({
    this.timerStatus = TimerStatus.initial,
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

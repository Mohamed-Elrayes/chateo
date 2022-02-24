import 'package:bloc/bloc.dart';
import 'package:chateo/core/constants/logger_devtool.dart';
import 'package:chateo/data/repositories/tiker_repo.dart';
import 'package:equatable/equatable.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit()
      : _ticker = const Ticker(),
        super(const TimerState());
  final Ticker _ticker;

  void startTimer(int duration) {
    emit(state.copyWith(timerStatus: TimerStatus.run));
    _ticker.tick(ticks: duration).listen((event) {
      if (event == 0) {
        emit(state.copyWith(timerStatus: TimerStatus.end));
        event.logWtf();
      }
      emit(state.copyWith(timerStatus: TimerStatus.run));
      event.logWtf();
    });
  }

  // @override
  // Future<void> close() {
  //   _tickerSubscription.cancel();
  //   return super.close();
  // }
}

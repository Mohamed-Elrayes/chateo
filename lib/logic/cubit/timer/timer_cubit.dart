import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/tiker_repo.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit(ticker)
      : _ticker = ticker,
        super(const TimerState());
  final Ticker _ticker;

  void startTimer(int duration) {
    emit(state.copyWith(timerStatus: TimerStatus.run));
     _ticker.tick(ticks: duration).listen((event) {
      if (event == 0) {
        emit(state.copyWith(timerStatus: TimerStatus.end));
      }
      emit(state.copyWith(timerStatus: TimerStatus.run));
    });
  }

  // @override
  // Future<void> close() {
  //   _tickerSubscription.cancel();
  //   return super.close();
  // }
}

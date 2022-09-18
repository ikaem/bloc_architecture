import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/constants/enums.dart';
import 'package:weather_bloc/logic/cubit/counter_cubit/counter_state.dart';
import 'package:weather_bloc/logic/cubit/internet_cubit/internet_cubit.dart';

class CounterCubit extends Cubit<CounterState> {
  // final InternetCubit internetCubit;
  // late StreamSubscription internetStreamSubscription;

  // CounterCubit({required this.internetCubit})
  CounterCubit() : super(const CounterState(counterValue: 0)) {
    // not calling this because we wnat to show how to communicated between cubits and blocs by using bloc lsitener
    // monitorInternetCubit();
  }

  // StreamSubscription<InternetState> monitorInternetCubit() {
  //   return internetStreamSubscription = internetCubit.stream.listen((event) {
  //     if (event is! InternetConnected) return;
  //     if (event.connectionType == ConnectionType.mobile) {
  //       increment();
  //     } else if (event.connectionType == ConnectionType.wifi) {
  //       decrement();
  //     }
  //   });
  // }

  @override
  Future<void> close() {
    // internetStreamSubscription.cancel();
    return super.close();
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));
  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));
}

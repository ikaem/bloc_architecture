import 'dart:async';
import 'dart:io';

import "package:bloc/bloc.dart";

void scratch() {
  // print("what");
  // Stream<int> boatStream() async* {
  //   for (int i = 1; i <= 10; i++) {
  //     print("Send boat no $i");

  //     await Future.delayed(Duration(seconds: 2));
  //     yield i;
  //   }
  // }

  // Stream<int> stream = boatStream();

  // stream.listen((event) {
  //   print("Received boat n $event");
  // });

  //

  final cubit = CounterCubit();

  final streamSubscription = cubit.stream.listen(print);

  print(cubit.state);

  cubit.increment();
  cubit.decrement();

  //
  final blocer = BlocCounter();
  print("this is bloc state: ${blocer.state}");

  blocer.add(CounterIncrementEvent());
  sleep(Duration.zero);
  blocer.add(CounterDecrementEvent());
  sleep(Duration.zero);
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

// enum CounterEvent {
//   increment,
//   decrement,
// }

abstract class CounterEvent {}

class CounterIncrementEvent extends CounterEvent {}

class CounterDecrementEvent extends CounterEvent {}

class BlocCounter extends Bloc<CounterEvent, int> {
  BlocCounter() : super(0) {
    on<CounterIncrementEvent>((event, emit) => emit(state + 1));
    on<CounterDecrementEvent>((event, emit) => emit(state - 1));
  }

  // // @override
  // Stream<int> mapEventToState(CounterEvent event) async* {
  //   switch (event) {
  //     case CounterEvent.increment:
  //       yield state + 1;
  //       break;
  //     case CounterEvent.decrement;
  //       yield state - 1;
  //       break;
  //   }
  // }
}

// // test\cubit\counter_cubit_test.dart

// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:weather_bloc/logic/cubit/counter_cubit/counter_cubit.dart';
// import 'package:weather_bloc/logic/cubit/counter_cubit/counter_state.dart';

// void main() {
//   group("CounterCubit", () {
//     late CounterCubit counterCubit;

//     setUp(() {
//       counterCubit = CounterCubit();
//     });

//     tearDown(() {
//       counterCubit.close();
//     });

//     test(
//       "should show initial state of CounterCubit to be CounterState(counterValue: 0)",
//       () {
//         // expect(counterCubit?.state.counterValue,
//         //     CounterState(counterValue: 0).counterValue);

//         expect(counterCubit.state, const CounterState(counterValue: 0));
//       },
//     );

//     blocTest(
//       "should emit CounterState(counterValue: -1, wasIncremented: false) when cubit.dencrement is called",
//       build: () => counterCubit,
//       act: (CounterCubit cubit) => cubit.decrement(),
//       expect: () => [
//         const CounterState(
//           counterValue: -1,
//           wasIncremented: false,
//         )
//       ],
//     );

//     blocTest(
//       "should emit CounterState(counterValue: 1, wasIncremented: true) when cubit.increment is called",
//       build: () => counterCubit,
//       act: (CounterCubit cubit) => cubit.increment(),
//       expect: () => [
//         const CounterState(
//           counterValue: 1,
//           wasIncremented: true,
//         )
//       ],
//     );
//   });
// }

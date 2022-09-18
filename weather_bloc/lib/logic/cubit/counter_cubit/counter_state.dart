import 'package:equatable/equatable.dart';

// class CounterState {
class CounterState extends Equatable {
  final int counterValue;
  final bool wasIncremented;

  const CounterState({
    required this.counterValue,
    this.wasIncremented = false,
  });

  @override
  List<Object?> get props => [counterValue, wasIncremented];
}

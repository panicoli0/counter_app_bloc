import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1); // add 1 to  the current state

  void decrement() => emit(state - 1); // Substract 1 to  the current state
}

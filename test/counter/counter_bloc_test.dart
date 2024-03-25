import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_counter/counter/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(CounterBloc, () {
    //variables
    late CounterBloc counterBloc;
    //setup
    setUp(() => {
          counterBloc = CounterBloc(),
        });
    //test
    test('initial state is 0', () {
      expect(counterBloc.state, equals(0));
    });
    blocTest('emits [1] when CounterIncrementPressed is added',
        build: () => counterBloc,
        act: ((bloc) => bloc.add(CounterIncrementPressed())),
        expect: () => [1]);
    blocTest('emits [-1] when CounterDecrementPressed is added',
        build: () => counterBloc,
        act: ((bloc) => bloc.add(CounterDecrementPressed())),
        expect: () => [-1]);
  });
}

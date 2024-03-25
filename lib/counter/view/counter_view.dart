import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/counter/counter_bloc.dart';

import '../counter_cubit.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final counterBlocProvider = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, dynamic>(
          builder: (context, state) {
            return Text(
              /// Only the Text widget is wrapped in a BlocBuilder because that is the only widget that needs to be rebuilt in response to state changes in the CounterCubit.
              /// Avoid unnecessarily wrapping widgets that don’t need to be rebuilt when a state changes.
              '$state',
              style: textTheme.displayMedium,
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
              key: const Key('counterView_increment_floatingActionButton'),
              child: const Icon(Icons.add),
              onPressed: () {
                print('onPressed CounterIncrementPressed');
                counterBlocProvider.add(CounterIncrementPressed());
              }),
          const SizedBox(height: 8),
          FloatingActionButton(
              key: const Key('counterView_decrement_floatingActionButton'),
              child: const Icon(Icons.remove),
              onPressed: () {
                print('onPressed CounterDecrementPressed');
                counterBlocProvider.add(CounterDecrementPressed());
              }),
        ],
      ),
    );
  }
}

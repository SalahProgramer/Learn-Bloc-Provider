import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bloc/counter_bloc.dart';

class FloatingButtons extends StatelessWidget {
  const FloatingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {
            // BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
            counterBloc.add(IncrementEvent());
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        // FloatingActionButton(
        //   onPressed: () {
        //     counterBloc.add(ResetEvent());
        //
        //   },
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.exposure_zero),
        // ),
        // FloatingActionButton(
        //   onPressed: () {
        //     counterBloc.add(DecrementEvent());
        //
        //   },
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.remove),
        // ),
      ],
    );
  }
}

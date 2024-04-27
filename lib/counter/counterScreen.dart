import 'package:bmicalclutor/counter/cubit.dart';
import 'package:bmicalclutor/counter/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child:
          BlocConsumer<CounterCubit, CounterStates>(listener: (context, state) {
        if (state is CounterPlusState) {
          print('plus ${state.counter}');
        }
        if (state is CounterMinusState) {
          print('minus ${state.counter}');
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Counter'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Counter Value:',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${CounterCubit.get(context).counter}',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  CounterCubit.get(context).plus();
                },
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              SizedBox(height: 16),
              FloatingActionButton(
                onPressed: () {
                  CounterCubit.get(context).minus();
                },
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
              ),
            ],
          ),
        );
      }),
    );
  }
}

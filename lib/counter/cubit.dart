import 'package:bmicalclutor/counter/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());

  static CounterCubit get(context) => BlocProvider.of(context);
  int counter = 10;

  void plus() {
    counter++;
    emit(CounterPlusState(counter));
  }

  void minus() {
    counter--;
    emit(CounterMinusState(counter));
  }
}




import 'package:flutter_basics_app/cubit/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitialState());

  int counter = 0;

  void increment (){
    counter++;
    emit(CounterIncrementState());
  }

  void decrement (){
    if (counter > 0) {
      counter--;
      emit(CounterDecrementState());
    }
  }
  void reset (){
    counter = 0;
    emit(CounterResetState());
  }
}
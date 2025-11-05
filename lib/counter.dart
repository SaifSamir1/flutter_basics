import 'package:flutter/material.dart';
import 'package:flutter_basics_app/cubit/counter_cubit.dart';
import 'package:flutter_basics_app/cubit/counter_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreenOld extends StatelessWidget {
  const CounterScreenOld({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter - setState (القديم) ❌'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'العداد:',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state){
                if(state is CounterIncrementState){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('incremented'),
                      duration: Duration(seconds: 1),
                    )
                  );
                }else if(state is CounterDecrementState){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('decremented'),
                      duration: Duration(seconds: 1),
                    )
                  );
                }

              },
              builder: (context, state) {
                return Text(
                  // '${context.read<CounterCubit>().counter}',
                  "${BlocProvider.of<CounterCubit>(context).counter}",
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                );
              },
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: 'inc',
                  onPressed: context.read<CounterCubit>().increment,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  heroTag: 'dec',
                  onPressed: context.read<CounterCubit>().decrement,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  heroTag: 'reset',
                  onPressed: context.read<CounterCubit>().reset,
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.hourglass_bottom),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

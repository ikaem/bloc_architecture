import 'package:bloc_learn/stores/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    // scratch();
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // this will result in block lookup in each rebuild
    // final bloc = context.read<CounterCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

/* 
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state.wasIncremented == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Incremented"),
                duration: Duration(seconds: 2),
              ),
            );
          } else if (state.wasIncremented == false) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Decremented"),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },

 */

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
              child: Text("Incremeent here as well"),
            ),
            SizedBox(
              height: 24,
            ),
            Builder(builder: (context) {
              final counterState = context.watch<CounterCubit>().state;
              // final counterState = context.watch<InternetCubit>().state;

              return Text(
                "This is Counter: ${counterState.counterValue}, and this is Internet: none",
                style: Theme.of(context).textTheme.headline2,
              );
            }),
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  // '$_counter',
                  '${state.counterValue}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
              listener: (context, state) {
                // TODO: implement listener
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Incremented"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Decremented"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
            ),

            /* 
            
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  // '$_counter',
                  '${state.counterValue}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            
             */

            Builder(builder: (context) {
              final value = context
                  .select((CounterCubit value) => value.state.counterValue);

              return Text("is is vlaue: $value");
            }),
            BlocBuilder<CounterCubit, CounterState>(
              buildWhen: (previus, current) =>
                  previus.counterValue != current.counterValue,
              builder: (context, state) {
                final valueOfCounter = state.counterValue;
                return Text("This is in bloc builder");
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    // context.bloc<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

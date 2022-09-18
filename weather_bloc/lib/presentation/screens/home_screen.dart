import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/constants/enums.dart';
import 'package:weather_bloc/logic/cubit/counter_cubit/counter_cubit.dart';
import 'package:weather_bloc/logic/cubit/counter_cubit/counter_state.dart';
import 'package:weather_bloc/logic/cubit/internet_cubit/internet_cubit.dart';
import 'package:weather_bloc/presentation/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  final Color color;

  const HomeScreen({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext homeScreenContext) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (blocListenerContext, state) {
        if (state is! InternetConnected) return;
        if (state.connectionType == ConnectionType.mobile) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state.connectionType == ConnectionType.wifi) {
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is InternetDisconnected) {
                    return const Center(
                      child: Text("No internet"),
                    );
                  }

                  if (state is InternetConnected) {
                    return Center(
                      child: Text(state.connectionType == ConnectionType.mobile
                          ? "Mobile"
                          : "Wifi"),
                    );
                  }

                  return Container();
                },
              ),
              Text("You have pusshed this too many times"),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncremented) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Incremented"),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  } else if (!state.wasIncremented) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Decremented"),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Text(state.counterValue.toString());
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    // why would we need this
                    heroTag: Text('${widget.title}'),
                    tooltip: "Increment",
                    child: Icon(Icons.add),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    // why would we need this
                    heroTag: Text('${widget.title} #2'),
                    tooltip: "Decrement",
                    child: Icon(Icons.remove),
                  )
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: widget.color),
                onPressed: () {
                  // but this is calling function, and passing it an argument - value that exists in the build function somewhere
                  Navigator.of(context).pushNamed("/second");
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     // builder: (context) => SecondScreen(
                  //     builder: (_) => BlocProvider.value(
                  //           value: BlocProvider.of<CounterCubit>(context),
                  //           child: SecondScreen(
                  //               title: "Coming from home screen",
                  //               color: Colors.green),
                  //         )));
                },
                child: Text("Go to second screen"),
              ),
              Builder(builder: (materialButtonContext) {
                return MaterialButton(
                  onPressed: () {
                    print("nothing much");
                    Navigator.of(context).pushNamed("/second");
                    // Navigator.of(homeScreenContext).pushNamed("/second");
                  },
                  child: Text("Testing"),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

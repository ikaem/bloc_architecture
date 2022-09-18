import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/logic/cubit/counter_cubit/counter_cubit.dart';
import 'package:weather_bloc/logic/cubit/counter_cubit/counter_state.dart';
import 'package:weather_bloc/presentation/screens/home_screen.dart';

class SecondScreen extends StatefulWidget {
  final String title;
  final Color color;

  const SecondScreen({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("The second screen"),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: widget.color),
              onPressed: () {
                Navigator.of(context).pushNamed("/third");
                // Navigator.of(context).push(MaterialPageRoute(
                //     // builder: (context) => BlocProvider.value(
                //     builder: (_) => BlocProvider.value(
                //           // context here is the app context - the one from material app - and that one works
                //           value: BlocProvider.of<CounterCubit>(context),
                //           child: HomeScreen(
                //               title: "Coming from second screen",
                //               color: Colors.yellow),
                //         )));
              },
              child: Text("Go to first screen"),
            )
          ],
        ),
      ),
    );
  }
}

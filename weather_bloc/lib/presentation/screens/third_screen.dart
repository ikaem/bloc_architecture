import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/logic/cubit/counter_cubit/counter_cubit.dart';
import 'package:weather_bloc/logic/cubit/counter_cubit/counter_state.dart';
import 'package:weather_bloc/presentation/screens/home_screen.dart';

class ThirdScreen extends StatefulWidget {
  final String title;
  final Color color;

  const ThirdScreen({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
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
            Text("The third screen"),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: widget.color),
              onPressed: () {
                Navigator.of(context).pushNamed("/");
                // Navigator.of(context).push(MaterialPageRoute(
                //     // builder: (context) => BlocProvider.value(
                //     builder: (_) => BlocProvider.value(
                //           // context here is the app context - the one from material app - and that one works
                //           value: BlocProvider.of<CounterCubit>(context),
                //           child: HomeScreen(
                //               title: "Coming from second screen",
                //               color: Colors.purple),
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

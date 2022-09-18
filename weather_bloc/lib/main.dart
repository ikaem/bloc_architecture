import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/logic/cubit/counter_cubit/counter_cubit.dart';
import 'package:weather_bloc/logic/cubit/counter_cubit/counter_state.dart';
import 'package:weather_bloc/logic/cubit/internet_cubit/internet_cubit.dart';
import 'package:weather_bloc/presentation/screens/home_screen.dart';
import 'package:weather_bloc/presentation/screens/routing/app_router.dart';
import 'package:weather_bloc/presentation/screens/third_screen.dart';
import 'package:weather_bloc/presentation/screens/second_screen.dart';

void main() {
  // we could potentially intantiate the router here too
  final connectivity = Connectivity();

  runApp(
    MyApp(
      connectivity: connectivity,
    ),
  );
}

// with global bloc provider, the app can now be stateless widget too
class MyApp extends StatefulWidget {
  final Connectivity connectivity;

  const MyApp({super.key, required this.connectivity});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final CounterCubit _counterCubit = CounterCubit();
  // could this be done

  @override
  void dispose() {
    super.dispose();
    // _counterCubit.close();
    // AppRouter.disposeCubit();
  }

  @override
  // this is defining function
  Widget build(BuildContext context) {
    // return BlocProvider<CounterCubit>(
    //   create: (context) => CounterCubit(),
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          // this is defining function
          create: (context) => InternetCubit(connectivity: widget.connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(
              // internetCubit: BlocProvider.of<InternetCubit>(context),
              ),
        )
      ],
      child: const MaterialApp(
        title: "Bloc Testing Demo",
        // onGenerateRoute: AppRouter.onGenerateRouteWithRouteAccess,
        onGenerateRoute: AppRouter.onGenerateRouteWithGlobalAccess,
        // note that we actually immeidately use the bloc provider here
        // home: BlocProvider<CounterCubit>(
        //   // we create cubit here that we defined
        //   create: (context) => CounterCubit(),
        //   child: HomeScreen(
        //     title: "Some title",
        //     color: Colors.red,
        //   ),
        // ),
        // routes: {
        //   "/": (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: const HomeScreen(
        //           title: "home page",
        //           color: Colors.red,
        //         ),
        //       ),
        //   "/second": (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: const SecondScreen(
        //           title: "home page",
        //           color: Colors.yellow,
        //         ),
        //       ),
        //   "/third": (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: const ThirdScreen(
        //           title: "home page",
        //           color: Colors.purple,
        //         ),
        //       ),
        // },
      ),
    );
  }
}

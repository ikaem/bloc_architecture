import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/logic/cubit/counter_cubit/counter_cubit.dart';
import 'package:weather_bloc/presentation/screens/home_screen.dart';
import 'package:weather_bloc/presentation/screens/second_screen.dart';
import 'package:weather_bloc/presentation/screens/third_screen.dart';

class AppRouter {
  // i dont like this - it is invisible when i look at the main.dart file

  // final CounterCubit _counterCubit = CounterCubit();
  // static final CounterCubit counterCubit = CounterCubit();

  // static void disposeCubit() {
  //   // counterCubit.close();
  // }

  static Route onGenerateRouteWithGlobalAccess(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        {
          return MaterialPageRoute(
              builder: (context) => const HomeScreen(
                    title: "Home page",
                    color: Colors.red,
                  ));

          // break;
        }
      case "/second":
        {
          return MaterialPageRoute(
            builder: (context) => const SecondScreen(
              title: "Second home page",
              color: Colors.yellow,
            ),
          );
          // break;
        }
      case "/third":
        {
          return MaterialPageRoute(
            builder: (context) => const ThirdScreen(
              title: "Third screen page",
              color: Colors.blue,
            ),
          );
          // break;
        }
      default:
        {
          throw RouteException("Unknown route");
        }
    }
  }

  // static Route onGenerateRouteWithRouteAccess(RouteSettings settings) {
  //   switch (settings.name) {
  //     case "/":
  //       {
  //         return MaterialPageRoute(
  //           builder: (context) => BlocProvider.value(
  //             value: counterCubit,
  //             child: const HomeScreen(
  //               title: "Home page",
  //               color: Colors.red,
  //             ),
  //           ),
  //         );

  //         // break;
  //       }
  //     case "/second":
  //       {
  //         return MaterialPageRoute(
  //           builder: (context) => BlocProvider.value(
  //             value: counterCubit,
  //             child: const SecondScreen(
  //               title: "Second home page",
  //               color: Colors.yellow,
  //             ),
  //           ),
  //         );
  //         // break;
  //       }
  //     case "/third":
  //       {
  //         return MaterialPageRoute(
  //           builder: (context) => BlocProvider.value(
  //             value: counterCubit,
  //             child: const ThirdScreen(
  //               title: "Third screen page",
  //               color: Colors.blue,
  //             ),
  //           ),
  //         );
  //         // break;
  //       }
  //     default:
  //       {
  //         throw RouteException("Unknown route");
  //       }
  //   }
  // }
}

class RouteException implements Exception {
  final String message;

  RouteException(this.message);
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:weather_app_ajaya/core/injection/injection.dart';
import 'package:weather_app_ajaya/core/routes/app_router.dart';
import 'package:weather_app_ajaya/features/homepage/presentation/bloc/weather_bloc.dart';

Future<void> main() async {
  await configureInjection();
  runApp(BlocProvider(
    create: (context) => getIt<WeatherBloc>(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return FlutterEasyLoading(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: AutoRouterDelegate(_appRouter),
            theme: ThemeData(
              useMaterial3: false,
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:satasat_app/routes/routes.gr.dart';
import 'package:satasat_app/screens/login/bloc/login_bloc.dart';

import 'constant/theme.dart';

final GlobalKey<ScaffoldMessengerState> snackbarMessanger =
    GlobalKey<ScaffoldMessengerState>();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: snackbarMessanger,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: 'Satasat',
        theme: lightTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}

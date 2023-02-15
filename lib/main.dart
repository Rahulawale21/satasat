import 'package:flutter/material.dart';
import 'package:satasat_app/routes/routes.gr.dart';

import 'constant/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'Satasat',
      theme: lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}

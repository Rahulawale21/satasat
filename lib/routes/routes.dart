import 'package:auto_route/annotations.dart';
import 'package:satasat_app/screens/splash_screen/splash_screen.dart';

import '../screens/login_screen.dart';

@AdaptiveAutoRouter(
  routes: [
    AdaptiveRoute(page: SplashScreen, initial: true),
    AdaptiveRoute(
      page: LoginScreen,
    ),
  ],
)
class $AppRouter {}

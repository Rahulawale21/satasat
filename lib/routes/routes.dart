import 'package:auto_route/annotations.dart';
import 'package:satasat_app/screens/dashboard/dashboard_screen.dart';
import 'package:satasat_app/screens/home/home.dart';
import 'package:satasat_app/screens/splash_screen/splash_screen.dart';

@AdaptiveAutoRouter(
  routes: [
    AdaptiveRoute(page: SplashScreen, initial: true),
    AdaptiveRoute(page: DashboardScreen),
    AdaptiveRoute(page: HomeScreen),
  ],
)
class $AppRouter {}

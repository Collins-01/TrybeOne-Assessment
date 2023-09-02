import 'package:flutter/material.dart';
import 'package:trybeone_assessment/presentation/presentation.dart';

import 'navigation_routes.dart';

class RouteGenerators {
  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case NavigationRoutes.HOME:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );

      case NavigationRoutes.CREATE_NEWS:
        return MaterialPageRoute(
          builder: (_) => CreateNewsView(),
        );
      case NavigationRoutes.SPLASH_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const SplashScreenView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${routeSettings.name}"),
            ),
          ),
        );
    }
  }
}

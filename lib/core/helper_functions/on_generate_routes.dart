import 'package:flutter/material.dart';
import 'package:fruits_hub/features/onboard/presentation/view/onboarding.dart';
import 'package:fruits_hub/features/splash/presentation/view/splash_view.dart';

class OnGenerateRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Onboarding.routeName:
        return MaterialPageRoute(builder: (_) => const Onboarding());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}

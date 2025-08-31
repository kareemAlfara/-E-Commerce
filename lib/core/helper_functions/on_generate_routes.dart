import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/presentation/view/forgetPassword.dart';
import 'package:fruits_hub/features/auth/presentation/view/newpassword.dart';
import 'package:fruits_hub/features/auth/presentation/view/signinView.dart';
import 'package:fruits_hub/features/auth/presentation/view/signupView.dart';
import 'package:fruits_hub/features/home/presentation/view/home.dart';
import 'package:fruits_hub/features/onboard/presentation/view/onboarding.dart';
import 'package:fruits_hub/features/splash/presentation/view/splash_view.dart';

import '../../features/auth/presentation/view/verification.dart';

class OnGenerateRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Onboarding.routeName:
        return MaterialPageRoute(builder: (_) => const Onboarding());
      case Signinview.routeName:
        return MaterialPageRoute(builder: (_) => const Signinview());
      case Signupview.routeName:
        return MaterialPageRoute(builder: (_) => const Signupview());
      case ForgetPasswordView.routeName:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case VerificationView.routeName:
        return MaterialPageRoute(builder: (_) => const VerificationView());
      case NewPassword.routeName:
        return MaterialPageRoute(builder: (_) => const NewPassword());
      case Home.routeName:
        return MaterialPageRoute(builder: (_) => const Home());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    } 
  }
}

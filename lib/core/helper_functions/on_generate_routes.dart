import 'package:fruits_hub/main.dart' show themeNotifier;  // 👈 import the global
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/services/theme_notifier.dart';
import 'package:fruits_hub/features/auth/presentation/view/forgetPassword.dart';
import 'package:fruits_hub/features/auth/presentation/view/newpassword.dart';
import 'package:fruits_hub/features/auth/presentation/view/signinView.dart';
import 'package:fruits_hub/features/auth/presentation/view/signupView.dart';
import 'package:fruits_hub/features/chechout/presentation/view/shippingView.dart';
import 'package:fruits_hub/features/chechout/presentation/view/widget/checkupView.dart';
import 'package:fruits_hub/features/home/domain/entites/allCartEntity.dart';
import 'package:fruits_hub/features/home/domain/entites/cartEntity.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/addnewCard.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/costomerView.dart';
import 'package:fruits_hub/features/home/presentation/view/home.dart';
import 'package:fruits_hub/features/home/presentation/view/mainView.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/ProfileDetailsScreen.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/favoritepage.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/myorders.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/profilePayments.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/whoAre.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/themostSale.dart';
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
      case TheMostSale.routeName:
        return MaterialPageRoute(builder: (_) => const TheMostSale());
      case Mainview.routeName:
        return MaterialPageRoute(
          builder: (_) => Mainview(themeNotifier: themeNotifier), // 👈 use it
        );
      case Signinview.routeName:
        return MaterialPageRoute(
          builder: (_) => Signinview(themeNotifier: themeNotifier), // 👈 give it to Signin
        );
      case Myorders.routeName:
        return MaterialPageRoute(builder: (_) => const Myorders());
      case ProfileDetailsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) =>  ProfileDetailsScreen(
            
          ),
          settings: settings,
        );
      case shippingView.routeName:
        return MaterialPageRoute(builder: (_) => const shippingView());
        case Favoritepage.routeName:
        return MaterialPageRoute(builder: (_) =>  Favoritepage());
      case Addnewcard.routeName:
        return MaterialPageRoute(builder: (_) => const Addnewcard());
      case Whoare.routeName:
        return MaterialPageRoute(builder: (_) => const Whoare());
      case ProfilePayments.routeName:
        return MaterialPageRoute(builder: (_) => const ProfilePayments());
      case Checkupview.routeName:
        return MaterialPageRoute(
          builder: (_) =>
              Checkupview(cartitem: settings.arguments as allcartEntity),
        );
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}

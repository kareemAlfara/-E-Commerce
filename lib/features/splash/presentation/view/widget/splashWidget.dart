import 'package:flutter/material.dart';
import 'package:fruits_hub/core/services/Shared_preferences.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/constants.dart';
import 'package:fruits_hub/features/auth/presentation/view/signinView.dart';
import 'package:fruits_hub/features/onboard/presentation/view/onboarding.dart';
import 'package:svg_flutter/svg.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    navigateToNextScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [SvgPicture.asset(Assets.imagesPlant)]),
            SvgPicture.asset(Assets.imagesLogo),
            SvgPicture.asset(Assets.imagesSplashBottom),
          ],
        ),
      ),
    );
  }

  void navigateToNextScreen() {
    bool isOnBoardingViewSeen = Prefs.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 2), () {
      if (isOnBoardingViewSeen) {
        Navigator.of(context).pushReplacementNamed(Signinview.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(Onboarding.routeName);
      }
    });
  }
}

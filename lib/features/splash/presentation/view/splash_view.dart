import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/features/splash/presentation/view/widget/splashWidget.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const routeName = 'splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return SplashWidget();
  }
}

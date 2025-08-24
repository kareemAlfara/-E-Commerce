import 'package:flutter/material.dart';
import 'package:fruits_hub/features/onboard/presentation/view/on_boarding_view_body.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});
  static const routeName = 'onboarding';

  @override
  Widget build(BuildContext context) {
    return const on_boarding_view_body();
  }
}

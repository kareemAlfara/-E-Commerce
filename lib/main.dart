import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper_functions/on_generate_routes.dart';
import 'package:fruits_hub/features/splash/presentation/view/splash_view.dart';

void main(List<String> args) {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: OnGenerateRoutes.generateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,

    );
  }
}
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper_functions/on_generate_routes.dart';
import 'package:fruits_hub/core/services/Shared_preferences.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/features/splash/presentation/view/splash_view.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/onboard/presentation/view/onboarding.dart';

void main(List<String> args)async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Cairo',
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryColor,
          )),
            localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      onGenerateRoute: OnGenerateRoutes.generateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,

    );
  }
}
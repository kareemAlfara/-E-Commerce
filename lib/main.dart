import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/helper_functions/on_generate_routes.dart';
import 'package:fruits_hub/core/services/Shared_preferences.dart';
import 'package:fruits_hub/core/services/custom_bloc_observer.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/features/auth/presentation/view/signupView.dart';
import 'package:fruits_hub/features/home/presentation/view/home.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
void main(List<String> args) async {
  await WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();

  await Supabase.initialize(
    url: 'https://euudvrftyscplhfwzxli.supabase.co',
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV1dWR2cmZ0eXNjcGxoZnd6eGxpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTYyMDg3MDksImV4cCI6MjA3MTc4NDcwOX0.coxogvY2IS51RAZ4gJAtaUNhX4ZtxEifHwnWBhO1U_8",
  );
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
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      onGenerateRoute: OnGenerateRoutes.generateRoute,
      initialRoute: Home.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}



import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/on_generate_routes.dart';
import 'package:fruits_hub/core/services/Shared_preferences.dart';
import 'package:fruits_hub/core/services/custom_bloc_observer.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/features/auth/presentation/view/signinView.dart';
import 'package:fruits_hub/features/auth/presentation/view/signupView.dart';
import 'package:fruits_hub/features/chechout/presentation/view/shippingView.dart';
import 'package:fruits_hub/features/chechout/presentation/view/widget/checkupView.dart';
import 'package:fruits_hub/features/home/data/repo_impl/Product_repo_impl.dart';
import 'package:fruits_hub/features/home/domain/usecases/addreviewsusecase.dart';
import 'package:fruits_hub/features/home/presentation/Cartcubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/addreviewcubit/add_review_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/home.dart';
import 'package:fruits_hub/features/home/presentation/view/mainView.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/mainviewbody.dart';
import 'package:fruits_hub/features/onboard/presentation/view/onboarding.dart';
import 'package:fruits_hub/features/splash/presentation/view/splash_view.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:app_links/app_links.dart';

void main(List<String> args) async {
   WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();

  await Supabase.initialize(
    url: 'https://euudvrftyscplhfwzxli.supabase.co',
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV1dWR2cmZ0eXNjcGxoZnd6eGxpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTYyMDg3MDksImV4cCI6MjA3MTc4NDcwOX0.coxogvY2IS51RAZ4gJAtaUNhX4ZtxEifHwnWBhO1U_8",
  );
  await Prefs.init();
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getString('user_id');
  log(userId.toString());
  // Listen for incoming deep links
final appLinks = AppLinks();
appLinks.uriLinkStream.listen((uri) {
  print("🔗 DeepLink received: $uri");
});
  runApp(MyApp(isLoggedIn: userId != null));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isLoggedIn});
  final bool isLoggedIn;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(),
        ),
          BlocProvider(
          create: (context) => AddReviewCubit(
            addreviewsusecase(ProductRepoImpl()),
          ),
        ),
      ],
      child:MaterialApp(
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
      initialRoute: isLoggedIn ? Mainview.routeName : SplashView.routeName,

      debugShowCheckedModeBanner: false,
    ),
    );
  }
}

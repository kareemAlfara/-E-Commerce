import 'package:flutter/material.dart';
import 'package:fruits_hub/core/services/theme_notifier.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/addnewCard.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/favoritepage.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/homeprofileScreen.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/myorders.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/profilePayments.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/myprofileScreens/whoAre.dart';

import 'package:svg_flutter/svg.dart';

import 'ProfileDetailsScreen.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({super.key, required this.themeNotifier});
  final ThemeNotifier themeNotifier;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        if (settings.name == 'profileDetails') {
          return MaterialPageRoute(
              builder: (_) =>  ProfileDetailsScreen(

              ));
        }else if (settings.name == 'myorders') {
          return MaterialPageRoute(
              builder: (_) => const Myorders());
        }
        else if (settings.name == 'profilePayments') {
          return MaterialPageRoute(
              builder: (_) => const ProfilePayments());
        }
          else if (settings.name == 'addnewcard') {
          return MaterialPageRoute(
              builder: (_) => const Addnewcard());
        }  else if (settings.name == 'whoare') {
          return MaterialPageRoute(
              builder: (_) => const Whoare());
        }
         else if (settings.name == 'Favoritepage') {
          return MaterialPageRoute(
              builder: (_) => const Favoritepage());
        }
        return MaterialPageRoute(builder: (_) =>  homeprofileScreen(themeNotifier: themeNotifier));
      },
    );
  }
}

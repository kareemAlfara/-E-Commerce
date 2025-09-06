import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/view/CartView.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/custom_bottom_navigation_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/mainviewbody.dart';

class Mainview extends StatefulWidget {
  static const String routeName = '/mainview';
  const Mainview({super.key, });

  @override
  State<Mainview> createState() => _MainviewState();
}

class _MainviewState extends State<Mainview> {
  int currentViewIndex = 0;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: (index) {
            currentViewIndex = index;

            setState(() {});
          },
        ),
      body: mainviewbody(currentViewIndex: currentViewIndex));
  }
}

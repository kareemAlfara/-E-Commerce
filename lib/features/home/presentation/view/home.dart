import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/FeatureList.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/HomeSearchWidget.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/productGridView.dart';
import 'widget/CustomAppbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomAppbarWidget(),
              ),
              SizedBox(height: 10),
              HomeSearchWidget(),
              // SizedBox(height: 10),
              FeatureList(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: defulttext(
                  data: "الأكثر مبيعاً",
                  color: Colors.black,
                  fw: FontWeight.bold,
                  fSize: 20,
                ),
              ),
              productGridView(),
            ],
          ),
        ),
      ),
    );
  }
}

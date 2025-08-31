import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/FeatureItem.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/HomeSearchWidget.dart';
import 'package:svg_flutter/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

import 'widget/CustomAppbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width - 32;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomAppbarWidget(),
            ),
            SizedBox(height: 10),
            HomeSearchWidget(),
            SizedBox(height: 10),
            Container(
              height: 170,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return FeatureItem(itemWidth: itemWidth);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 8);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

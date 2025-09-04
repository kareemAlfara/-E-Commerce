import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/productGridView.dart';
import 'package:svg_flutter/svg.dart';

class TheMostSale extends StatelessWidget {
  const TheMostSale({super.key});
  static const String routeName = 'themostsale';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: const Text("الأكثر مبيعاً"),
        actions: [
          GestureDetector(
            onTap: () async {
              // Handle notification tap
            },
            child: SvgPicture.asset(
              Assets.imagesNotification,
              fit: BoxFit.fill,
              height: 30,
              width: 30,
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              defulttext(
                data: "الأكثر مبيعاً",
                color: Colors.black,
                fw: FontWeight.bold,
                fSize: 20,
              ),
              SizedBox(height: 10),
              productGridView(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/home/presentation/Cartcubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/productGridView.dart';
import 'package:svg_flutter/svg.dart';
class TheMostSale extends StatelessWidget {
  const TheMostSale({super.key});
  static const String routeName = 'themostsale';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context, title: 'الأكثر مبيعاً'),
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

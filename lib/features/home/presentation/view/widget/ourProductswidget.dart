import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';

class ourProductswidget extends StatelessWidget {
  const ourProductswidget({super.key, required this.product});
  final productModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(product.image),
            ),
          ),
          defulttext(data: product.name, fSize: 16, fw: FontWeight.bold),
        ],
      ),
    );
  }
}

class productModel {
  final String name;
  final String image;

  productModel({required this.name, required this.image});
}

List<productModel> productList = [
  productModel(name: "افوجاتو", image: "${Assets.imagesAvocado}"),
  productModel(name: "فراولة", image: "${Assets.imagesStrawberry}"),
  productModel(name: "موز", image: "${Assets.imagesBanana}"),
  productModel(name: "بطيخ", image: "${Assets.imagesWatermelonTest}"),
  productModel(name: "انانس", image: "${Assets.imagesPinApple}"),
];


import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/ourProductswidget.dart';

class ourproductListview extends StatelessWidget {
  const ourproductListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            ourProductswidget(product: productList[index]),
        separatorBuilder: (context, index) => SizedBox(width: 11),
        itemCount: productList.length,
      ),
    );
  }
}

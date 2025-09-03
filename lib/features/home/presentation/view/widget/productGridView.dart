
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/productItem.dart';

class productGridView extends StatelessWidget {
  const productGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DynamicHeightGridView(
                        physics: const NeverScrollableScrollPhysics(), // Disable inner scrolling
        shrinkWrap: true, // Important: makes grid take only needed space
    
        builder: (context, index) =>   productItem(),
       itemCount:10, crossAxisCount: 2);
  }
}

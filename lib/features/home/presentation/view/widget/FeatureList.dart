
import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/FeatureItem.dart';

class FeatureList extends StatelessWidget {
  const FeatureList({
    super.key,

  });

  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return FeatureItem();
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 8);
        },
      ),
    );
  }
}


import 'package:card_swiper/card_swiper.dart';
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
      child:Swiper(
                itemCount: featureItems.length,
                itemBuilder: (context, index) {
          return FeatureItem(
            model: featureItems[index],
          ); },
                autoplay: true,
                duration: 188,),
    );
  }
}

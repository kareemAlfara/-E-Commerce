
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:svg_flutter/svg.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
                SvgPicture.asset(Assets.imagesPlant)  ,
            ],), 
        SvgPicture.asset(Assets.imagesLogo)  ,
        SvgPicture.asset(Assets.imagesSplashBottom
        )  ,
    
        ],),
      )
    );
  }
}
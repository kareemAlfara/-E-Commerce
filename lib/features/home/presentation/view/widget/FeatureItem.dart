import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/HomeSearchWidget.dart';
import 'package:svg_flutter/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class FeatureItem extends StatelessWidget {
  const FeatureItem({
    super.key,
  
  });



  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width - 32;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: SizedBox(
              width: itemWidth,
              child: AspectRatio(
       aspectRatio: 342 / 158,
       child: Stack(
         children: [
           Positioned(
             left: 0,
             top: 0,
             bottom: 0,
             right: itemWidth * .4,
             child: SvgPicture.asset(
               Assets.imagesPageViewItem2Image,
               fit: BoxFit.fill,
             ),
           ),
           Container(
             width: itemWidth * .5,
             decoration: const BoxDecoration(
               image: DecorationImage(
                 image: svg.Svg(Assets.imagesFeaturedItemBackground),
                 fit: BoxFit.fill,
               ),
             ),
             child: Padding(
               padding: const EdgeInsets.only(
                 right: 20,
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const SizedBox(
                     height: 25,
                   ),
                     defulttext(
                         data: "    عرض العيد",
                         color: Colors.white,
                         fw: FontWeight.w600,
                         fSize: 14,
                       ),
                       SizedBox(height: 10),
                       defulttext(
                         data: "   خصم 25%",
                         color: Colors.white,
                         fw: FontWeight.bold,
                         fSize: 20,
                       ),
                       SizedBox(height: 10),
                       ElevatedButton(
                         onPressed: () {},
                         child: defulttext(
                           data: "تسوق الآن",
                           color: Color(0xff1B5E37),
                           fw: FontWeight.bold,
                           fSize: 16,
                         ),
                       ),
                 ],
               ),
             ),
           )
         ],
       ),
              ),
            ),
          ),
    );
  }
}

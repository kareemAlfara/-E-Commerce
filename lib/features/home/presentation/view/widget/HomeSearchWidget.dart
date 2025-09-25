
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:svg_flutter/svg.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, ),
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
    color: Colors.grey.withOpacity(0.1),
    spreadRadius: 2,
    blurRadius: 5,
    offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            color: Theme.of(context).brightness == Brightness.dark ? Colors.black12.withOpacity(0.6) : Colors.white,
            borderRadius: BorderRadius.circular(12),
          
          ),
          child: Row(
            children: [
            GestureDetector(
            onTap: () {
              print("Search icon tapped");
            },
            child: SvgPicture.asset(
              Assets.imagesSearchIcon,
              fit: BoxFit.scaleDown,
            ),
          ),
              const SizedBox(width: 8),
              Expanded(
    child: defulttext(
                          context: context,
      
      data: "ابحث عن...", color: Colors.grey, fSize: 16),
              ),
              GestureDetector(
    onTap: () {
      print("Search icon tapped");
    },
    child: SvgPicture.asset(
      Assets.imagesFilter,
      fit: BoxFit.scaleDown,
    ),
              ),
            ],
          ),
        );
  }
}

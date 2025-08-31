
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:svg_flutter/svg.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
    color: Colors.grey.withOpacity(0.1),
    spreadRadius: 2,
    blurRadius: 5,
    offset: Offset(0, 1), // changes position of shadow
              ),
            ],
            color:  Colors.white,
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
    child: TextField(
      textAlign: TextAlign.right, // للكتابة بالعربي
      decoration: InputDecoration(
        hintText: "ابحث عن...",
        hintStyle: TextStyle(
          color: Colors.grey[500],
        ),
        border: InputBorder.none,
      ),
    ),
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

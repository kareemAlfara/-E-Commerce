import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:svg_flutter/svg.dart';

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(Assets.imagesProfileImage),
        ),
        SizedBox(width: 6),
        Column(
          children: [
            defulttext(
              data: "صباح الخير !..",
              fSize: 17,
              color: Colors.grey[600],
              fw: FontWeight.w600,
            ),
            SizedBox(height: 3),
            defulttext(data: "محمود صالخ", fSize: 19, fw: FontWeight.w600),
          ],
        ),
        Spacer(),
        SvgPicture.asset(
          Assets.imagesNotification,
          fit: BoxFit.fill,
          height: 30,
          width: 30,
        ),
        SizedBox(width: 10),
      ],
    );
  }
}

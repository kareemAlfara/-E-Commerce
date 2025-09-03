
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';

class productItem extends StatelessWidget {
  const productItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        color: Colors.grey[100],
        padding: EdgeInsets.all(11),
        width: MediaQuery.sizeOf(context).width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
            Center(
              child: Image.asset(
                Assets.imagesWatermelonTest,
                fit: BoxFit.fill,
                height: 130,
              ),
            ),
            // SizedBox(height: 12),
            defulttext(
              data: "بطيخ",
              color: Colors.black,
              fw: FontWeight.bold,
              fSize: 16,
            ),
            // SizedBox(height: 6),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          defulttext(
              data: " 20 جنيه / الكيلو",
              color: Colors.orange[500],
              fw: FontWeight.bold,
              fSize: 13,
            ),
            CircleAvatar(
              backgroundColor: AppColors.lightPrimaryColor,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.add),color: Colors.white,))
      ],)
          
          ],
        ),
      ),
    );
  }
}

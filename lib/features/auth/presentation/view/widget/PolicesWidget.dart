

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

class PolicesWidget extends StatelessWidget {
  const PolicesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'cairo',
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text:
                  'من خلال إنشاء حساب ، فإنك توافق على ',
              style: TextStyle(color: Colors.grey),
            ),
            TextSpan(
              text: 'الشروط  الأحكام الخاصة بنا',
              style: TextStyle(
                color: AppColors.lightPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

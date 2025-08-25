import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/components.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed,
   required this.text, this.fSize=14});
  final VoidCallback onPressed;
  final String text;
  final double fSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        onPressed: onPressed,
        child: defulttext(data: text, color: Colors.white,fSize: fSize),
      ),
    );
  }
}

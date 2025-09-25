import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/components.dart';

PreferredSizeWidget? AuthAppbar({required String title, required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_new_outlined),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    centerTitle: true,
    title: defulttext(
      context: context,
      data: title,
      fw: FontWeight.w700,
      fSize: 20,
    ),
  );
}
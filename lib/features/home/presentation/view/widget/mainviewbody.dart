import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/view/CartView.dart';
import 'package:fruits_hub/features/home/presentation/view/costomerView.dart';
import 'package:fruits_hub/features/home/presentation/view/home.dart';
import 'package:fruits_hub/features/home/presentation/view/productView.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/notifications.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/searchPage.dart';

class mainviewbody extends StatelessWidget {
  const mainviewbody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    // IndexedStack دي علشان مش كل لاما اخرج من صفحة لصفحة ميعملش تحميل للصفحة من اول وجديد بيحمل الصفحة مرة واحدة فقط
    return IndexedStack(
      index: currentViewIndex,
      children: const [
      Home(),
      ProductView(),
      CartView(
        cartItems: [],
      ),
      CustomerView(),
      ],
    );
  }
}
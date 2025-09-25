import 'package:flutter/material.dart';

import 'package:fruits_hub/core/services/theme_notifier.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/mainviewBolcConsumer.dart';
class Mainview extends StatefulWidget {
  static const String routeName = '/mainview';
  const Mainview({super.key, required this.themeNotifier});
  final ThemeNotifier themeNotifier;

  @override
  State<Mainview> createState() => _MainviewState();
}

class _MainviewState extends State<Mainview> {


  @override
  Widget build(BuildContext context) {
    return Mainviewbolcconsumer(
      themeNotifier: widget.themeNotifier,
    );
  }
}

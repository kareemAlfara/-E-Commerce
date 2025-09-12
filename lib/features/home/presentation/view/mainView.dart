import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart' show Fluttertoast;
import 'package:fruits_hub/features/home/presentation/Cartcubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/CartView.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/custom_bottom_navigation_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/mainviewBolcConsumer.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/mainviewbody.dart';

class Mainview extends StatefulWidget {
  static const String routeName = '/mainview';
  const Mainview({super.key});

  @override
  State<Mainview> createState() => _MainviewState();
}

class _MainviewState extends State<Mainview> {


  @override
  Widget build(BuildContext context) {
    return Mainviewbolcconsumer();
  }
}

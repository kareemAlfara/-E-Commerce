import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/chechout/presentation/Checkupcubit/checkup_cubit.dart';
import 'package:fruits_hub/features/chechout/presentation/view/shippingView.dart';
import 'package:fruits_hub/features/chechout/presentation/view/widget/checkupbody.dart';
import 'package:fruits_hub/features/home/domain/entites/allCartEntity.dart';
import 'package:fruits_hub/features/home/domain/entites/cartEntity.dart';

class Checkupview extends StatelessWidget {
  const Checkupview({super.key, required this.cartitem});
  static const routeName = 'checkupview';
  final allcartEntity cartitem;
  @override
  Widget build(BuildContext context) {
    return checkupBody(cartitem: cartitem,);
  }
}

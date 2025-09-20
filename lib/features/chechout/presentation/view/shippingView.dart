import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/chechout/domain/entities/ordereitity.dart';
import 'package:fruits_hub/features/chechout/presentation/Checkupcubit/checkup_cubit.dart';

class shippingView extends StatelessWidget {
  const shippingView({super.key});
  static const String routeName = 'shippingView';
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CheckupCubit>();

    return Scaffold(
      body: BlocBuilder<CheckupCubit, CheckupState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 22),
                shippingContainer(
                  index: 0,
                  title: " الدفع عن الإستلام",
                  Subtitle: "التسليم من المكان  ",
                  price:
                      " ${(CheckupCubit.get(context).order!.cartitem.gettotalprice() + 40).toString()} جنية  ",
                ),
                SizedBox(height: 10),
                shippingContainer(
                  index: 1,
                  title: "اشتري الأن وأدفع اونلاين",
                  Subtitle: "يرجي تحديد طريقة الدفع  ",
                  price:
                      " ${CheckupCubit.get(context).order!.cartitem.gettotalprice()} جنية  ",
                ),
                SizedBox(height: 150),
                CustomButton(
                  text: "التالي",
                  onPressed: () {
                    final order = cubit.order;
                    if (order!.payWithcach == null) {
                      Fluttertoast.showToast(msg: "يرجي تحديد طريقة الدفع  ");
                    } else {
                      cubit.changeIndex(state.index + 1);
                    }

                    // log(cubit.index.toString());
                  },
                  fSize: 18,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class shippingContainer extends StatelessWidget {
  const shippingContainer({
    super.key,
    required this.index,
    required this.title,
    required this.Subtitle,
    required this.price,
  });
  final int index;
  final String title;
  final String Subtitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    var cubit = CheckupCubit.get(context);

    return BlocBuilder<CheckupCubit, CheckupState>(
      builder: (context, state) {
        bool isSelected = state.paymentIndex == index;

        return GestureDetector(
          onTap: () {
            cubit.changepayment(index);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              border: isSelected
                  ? Border.all(color: AppColors.primaryColor)
                  : Border.all(color: Colors.white),
            ),
            height: 85,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 17,
                  ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: isSelected
                          ? AppColors.primaryColor
                          : Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defulttext(data: title, fSize: 14, fw: FontWeight.w700),
                      SizedBox(height: 7),
                      defulttext(
                        data: Subtitle,
                        fSize: 14,
                        color: Colors.grey,
                        fw: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defulttext(
                        data: price,
                        fSize: 16,
                        fw: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Appcycle extends StatelessWidget {
  const Appcycle({
    super.key,
    required this.title,
    required this.index,
    required this.isexist,
  });
  final String title;
  final int index;
  final bool isexist;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isexist
            ? CircleAvatar(
                radius: 14,
                backgroundColor: AppColors.primaryColor,
                child: Icon(Icons.check, color: Colors.white, size: 16),
              )
            : CircleAvatar(
                radius: 12,
                backgroundColor: Colors.grey[300],
                child: defulttext(
                  data: "$index",
                  fSize: 14,
                  fw: FontWeight.bold,
                ),
              ),

        Padding(
          padding: const EdgeInsets.all(8.0),

          child: defulttext(
            data: "$title",
            fSize: 14,
            fw: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

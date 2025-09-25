import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/chechout/presentation/view/widget/OrderTracking.dart';
import 'package:fruits_hub/features/chechout/presentation/view/widget/checkupView.dart';
import 'package:fruits_hub/features/home/presentation/Cartcubit/cart_cubit.dart';
import 'package:svg_flutter/svg.dart';

class Paymentsuccess extends StatelessWidget {
  const Paymentsuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        title: "الدفع",
        context: context,
        isShowActions: false,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.4,
              child: Stack(
                children: [
                  SvgPicture.asset(Assets.imagesSplashBottom),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightPrimaryColor,
                      ),
                      padding: const EdgeInsets.all(20),
                      child: SvgPicture.asset(
                        Assets.imagesCheck,
                        width: 70,
                        height: 70,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 22),
          Text(
            "تم الدفع بنجاح",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 7),
          defulttext(
            context: context,
            data: "رقم الطلب : 123456",
            fw: FontWeight.bold,
            color: Colors.grey,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              onPressed: () {
                navigat(context, widget: OrderTracking());
              },
              text: "تتبع الطلب",
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              navigat(context, widget:  Checkupview(
                cartitem: context.read<CartCubit>().allcartEntiy,
                
              ));
            },
            child: Text(
              "الذهاب للصفحة الرئيسية",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 55),
        ],
      ),
    );
  }
}

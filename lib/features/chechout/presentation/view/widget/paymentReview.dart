import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/chechout/presentation/Checkupcubit/checkup_cubit.dart';
import 'package:fruits_hub/features/chechout/presentation/view/widget/paymentSuccess.dart';
import 'package:svg_flutter/svg_flutter.dart';

class PaymentReview extends StatelessWidget {
  const PaymentReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CheckupCubit, CheckupState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              defulttext(
                context: context,
                data: "ملخص الطلب :", fSize: 14, fw: FontWeight.bold),
              SizedBox(height: 20),
              Container(
                height: 150,
                // width: 350,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: defulttext(
                          context: context,

                            data: "المجموع الفرعي : ",
                            fSize: 14,
                            fw: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        defulttext(
                          context: context,

                          data: " ${CheckupCubit.get(context).order!.cartitem.gettotalprice()} جنية",
                          fSize: 16,
                          color: Colors.black,
                          fw: FontWeight.w700,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: defulttext(
                          context: context,

                            data: " التوصيل : ",
                            fSize: 14,
                            fw: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                  state.paymentIndex==1  ?  defulttext(
                          context: context,

                          data: " 0 جنية",
                          fSize: 16,
                          fw: FontWeight.w500,
                          color: Colors.grey,
                        ):
                          defulttext(
                          context: context,
                          data: " 40 جنية",
                          fSize: 16,
                          fw: FontWeight.w500,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 11),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: defulttext(
                          context: context,

                            data: " الكلي : ",
                            fSize: 18,
                            fw: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      state.paymentIndex==1?    defulttext(
                          context: context,

                          data: " ${(CheckupCubit.get(context).order!.cartitem.gettotalprice())} جنية",
                          fSize: 17,
                          fw: FontWeight.w700,
                          color: Colors.black,

                        ): defulttext(
                          context: context,

                          data: " ${(CheckupCubit.get(context).order!.cartitem.gettotalprice())+40} جنية",
                          fSize: 17,
                          fw: FontWeight.w700,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              defulttext(
                          context: context,

                data: " يرجي تأكيد  طلبك",
                fSize: 16,
                fw: FontWeight.bold,
              ),
              SizedBox(height: 20),

              Container(
                // width: 350,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: defulttext(
                          context: context,

                            data: " وسيلة الدفع : ",
                            fSize: 14,
                            fw: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SvgPicture.asset(Assets.imagesEdit),
                        defulttext(
                          context: context,

                          data: " تعديل ",
                          fw: FontWeight.w700,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(height: 17),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        defulttext(
                          context: context,

                          data: "      **** **** **** 1234",
                          fSize: 16,
                          fw: FontWeight.w700,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 11),
                        Container(
                          padding: EdgeInsets.all(11),

                          decoration: BoxDecoration(
                            color: Color(0xff1434CB),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: SvgPicture.asset(
                            Assets.imagevisa,
                            width: 40,
                            height: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 10),

              Container(
                // width: 350,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: defulttext(
                            context: context,
                            data: "  عنوا التوصيل  : ",
                            fSize: 14,
                            fw: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SvgPicture.asset(Assets.imagesEdit),
                        defulttext(
                          context: context,
                          data: " تعديل ",
                          fw: FontWeight.w700,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(height: 17),
                    Row(
                      children: [
                        SvgPicture.asset(Assets.imagesLocation),

                        defulttext(
                          context: context,
                          data: "     شارع 1, القاهرة, مصر",
                          fSize: 16,
                          fw: FontWeight.w700,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: "تاكيد الطلب",
                onPressed: () {
                  navigat(context, widget: Paymentsuccess());
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

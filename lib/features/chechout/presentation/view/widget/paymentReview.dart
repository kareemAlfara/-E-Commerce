import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/chechout/presentation/view/widget/paymentSuccess.dart';
import 'package:svg_flutter/svg_flutter.dart';

class PaymentReview extends StatelessWidget {
  const PaymentReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          defulttext(data: "ملخص الطلب :", fSize: 14, fw: FontWeight.bold),
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
                        data: "المجموع الفرعي : ",
                        fSize: 14,
                        fw: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    defulttext(
                      data: " 150 جنية",
                      fSize: 16,
                      fw: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: defulttext(
                        data: " التوصيل : ",
                        fSize: 14,
                        fw: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    defulttext(
                      data: " 30 جنية",
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
                        data: " الكلي : ",
                        fSize: 18,
                        fw: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    defulttext(
                      data: " 180 جنية",
                      fSize: 17,
                      fw: FontWeight.w700,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          defulttext(data: " يرجي تأكيد  طلبك", fSize: 16, fw: FontWeight.bold),
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
                        data: " وسيلة الدفع : ",
                        fSize: 14,
                        fw: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SvgPicture.asset(Assets.imagesEdit),
                    defulttext(
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
                        data: "  عنوا التوصيل  : ",
                        fSize: 14,
                        fw: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SvgPicture.asset(Assets.imagesEdit),
                    defulttext(
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
      ),
    );
  }
}

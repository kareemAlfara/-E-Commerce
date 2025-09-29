import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/chechout/presentation/Checkupcubit/checkup_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:svg_flutter/svg.dart';

class Paymentwidget extends StatelessWidget {
  const Paymentwidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CheckupCubit>();

    return SingleChildScrollView(
      child: BlocBuilder<CheckupCubit, CheckupState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 22),
                defulttext(
                  context: context,
                  data: "أختار طريقه الدفع المناسبه :",
                  fw: FontWeight.bold,
                ),
                SizedBox(height: 11),

                defulttext(
                  context: context,
                  data: "من فضلك اختر طريقه الدفع المناسبه لك.",
                  fw: FontWeight.w700,
                  color: Colors.grey,
                ),
                SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // SvgPicture.asset(Assets.imageapple_pay),
                    pay_option(
                      image: Assets.imageapple_pay,
                      color: Colors.white,
                    ),

                    pay_option(image: Assets.imagepaypal, color: Colors.white),
                    pay_option(
                      image: Assets.image_instapay,
                      color: Colors.white,
                    ),

                    GestureDetector(
                      onTap: () async {
                        Future<String> createPaymentIntent(int amount) async {
                          final url =
                              'https://euudvrftyscplhfwzxli.supabase.co/functions/v1/create-payment-intent';

                          final response = await http.post(
                            Uri.parse(url),
                            headers: {
                              'Content-Type': 'application/json',
                              'Authorization':
                                  'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV1dWR2cmZ0eXNjcGxoZnd6eGxpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTYyMDg3MDksImV4cCI6MjA3MTc4NDcwOX0.coxogvY2IS51RAZ4gJAtaUNhX4ZtxEifHwnWBhO1U_8',
                            },
                            body: jsonEncode({
                              'amount': amount, // in cents (e.g., $10 = 1000)
                              'currency': 'usd', // or 'eur', etc.
                            }),
                          );

                          if (response.statusCode == 200) {
                            final data = jsonDecode(response.body);
                            return data['clientSecret'];
                          } else {
                            throw Exception(
                              'Failed to create payment intent: ${response.body}',
                            );
                          }
                        }

                        Future<void> pay(int amount) async {
                          final clientSecret = await createPaymentIntent(
                            amount,
                          );

                          await Stripe.instance.initPaymentSheet(
                            paymentSheetParameters: SetupPaymentSheetParameters(
                              paymentIntentClientSecret: clientSecret,
                              merchantDisplayName: 'Fruit Hub',
                              style: ThemeMode.system,
                            ),
                          );

                          await Stripe.instance.presentPaymentSheet();
                        }

                        pay(100);
                      },
                      child: pay_option(
                        image: Assets.imagevisa,
                        color: Color(0xff1434CB),
                      ),
                    ),

                    // SvgPicture.asset(Assets.image_instapay),
                    // SvgPicture.asset(Assets.imagevisa),
                  ],
                ),
                SizedBox(height: 22),
                defulitTextFormField(
                  context: context,

                  controller: cubit.paymentnamecontroller,
                  hintText: ' أسم حامل البطاقة',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "أدخل   أسم حامل البطاقة";
                    }
                    return null;
                  },
                  isobscure: false,
                ),
                SizedBox(height: 11),
                defulitTextFormField(
                  context: context,

                  controller: cubit.paymentcardNumcontroller,
                  hintText: ' رقم البطاقة ',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "أدخل  رقم البطاقة";
                    }
                    return null;
                  },
                  isobscure: false,
                ),
                SizedBox(height: 11),

                Container(
                  height: 70,
                  // width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: defulitTextFormField(
                          context: context,

                          controller: cubit.paymentDatecontroller,
                          hintText: ' تاريخ الصلاحية ',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "أدخل  تاريخ الصلاحية";
                            }
                            return null;
                          },
                          isobscure: false,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: defulitTextFormField(
                          context: context,

                          controller: cubit.paymentCVVcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please inter the  number of CVV";
                            }
                            return null;
                          },

                          hintText: "CVV",
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 11),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.3, // 🔥 make it 1.5x bigger
                      child: Checkbox(
                        value: state.isDefultCard,
                        onChanged: (value) {
                          cubit.isdefultcard(value);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    defulttext(context: context, data: "جعل البطاقة افتراضية"),
                  ],
                ),
                SizedBox(height: 22),
                CustomButton(
                  onPressed: () {
                    cubit.changeIndex(state.index + 1);
                    log(state.index.toString());
                  },
                  text: "تاكيد & استمرار",
                  fSize: 16,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class pay_option extends StatelessWidget {
  const pay_option({super.key, required this.image, required this.color});
  final String image;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 66,
      padding: EdgeInsets.all(7),

      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),

      child: SvgPicture.asset(image, width: 40, height: 15),
    );
  }
}

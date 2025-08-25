import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/AuthAppbar.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../SigninCubit/signin_cubit.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});
  static const routeName = 'Verification';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(),
      child: BlocConsumer<SigninCubit, Signinstate>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = SigninCubit().get(context);
          return Scaffold(
            appBar: AuthAppbar(title:   "التحقق من الرمز", context: context),
            body: Column(
              children: [
                SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: defulttext(
                    data:
                      "أدخل الرمز الذي أرسلناه إلى عنوان بريدك التالي\nMaxxx@email.com",
                    fSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: PinCodeTextField(
                  appContext: context,
                  length: 4, // عدد الخانات
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 60,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveColor: Colors.grey,
                    activeColor: Colors.green,
                    selectedColor: Colors.orange,
                  ),
                  enableActiveFill: true,
                  onChanged: (value) {},
                                ),
                ),

              const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(onPressed: () {}, text:     "تحقق من الرمز",fSize: 20,),
                ),
            
              const SizedBox(height: 15),

              // 🔹 رابط إعادة إرسال
              TextButton(
                onPressed: () {
                  // TODO: إعادة إرسال الرمز
                },
                child: const Text(
                  "إعادة إرسال الرمز",
                  style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ),
              ],
            ),
          );
        },
      ),
    );
  }
}
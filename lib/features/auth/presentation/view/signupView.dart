import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/AuthAppbar.dart';
import 'package:fruits_hub/core/widget/SignigContainer.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/auth/presentation/signupcubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/view/signinView.dart';
import 'package:svg_flutter/svg.dart';

class Signupview extends StatelessWidget {
  const Signupview({super.key});
  static const routeName = 'Signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = SignupCubit().get(context);
          return Scaffold(
            appBar: AuthAppbar(title: 'حساب جديد', context: context),
            body: SingleChildScrollView(
              child: Form(
                key: cubit.formkey,
                child: Column(
                  children: [
                    SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.all(8.0),

                      child: defulitTextFormField(
                        controller: cubit.namecontroller,
                        hintText: 'الاسم كامل',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "أدخل الاسم كامل";
                          }
                          return null;
                        },
                        isobscure: false,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),

                      child: defulitTextFormField(
                        controller: cubit.emailcontroller,
                        hintText: 'البريد الإلكتروني',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "أدخل البريد الإلكتروني";
                          }
                          return null;
                        },
                        isobscure: false,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: defulitTextFormField(
                        controller: cubit.passcontroller,
                        hintText: 'كلمة المرور',
                        isobscure: cubit.issecure,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "أدخل كلمة المرور";
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changePaswordicon();
                          },

                          icon: cubit.issecure
                              ? Icon(Icons.visibility, color: Colors.grey)
                              : Icon(Icons.visibility_off, color: Colors.grey),
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 1.3, // 🔥 make it 1.5x bigger
                            child: Checkbox(
                              value: cubit.ischecked,
                              onChanged: (value) {
                                cubit.changecheckicon();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'cairo',
                                  fontWeight: FontWeight.w600,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'من خلال إنشاء حساب ، فإنك توافق على ',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  TextSpan(
                                    text: 'الشروط  الأحكام الخاصة بنا',
                                    style: TextStyle(
                                      color: AppColors.lightPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        text: 'إنشاء حساب جديد',
                        fSize: 18,
                        onPressed: () {
                          if (cubit.formkey.currentState!.validate()) {
                            // Handle login
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        defulttext(
                          data: 'امتلك حساب بالفعل ',
                          fSize: 16,
                          color: Colors.grey,
                          fw: FontWeight.w600,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(
                              context,
                              Signinview.routeName,
                            );
                          },
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: defulttext(
                            data: 'تسجيل الدخول',
                            fSize: 16,
                            color: AppColors.lightPrimaryColor,
                            fw: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 42),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/services/Shared_preferences.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/AuthAppbar.dart';
import 'package:fruits_hub/core/widget/SignigContainer.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/presentation/signupcubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/view/signinView.dart';
import 'package:svg_flutter/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'PolicesWidget.dart';
import 'have_an_account_widget.dart';

class SignupbodyWidget extends StatelessWidget {
  const SignupbodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state)async {
        if (state is SignupLoadingState) {
                      Fluttertoast.showToast(
    msg: 'جاري إنشاء الحساب',backgroundColor: Colors.amber);
        } else if (state is SignupSuccessState) {
          Navigator.popAndPushNamed(context, Signinview.routeName);
            await Prefs.saveUserIdToPrefs ();

          Fluttertoast.showToast(
            msg: 'تم إنشاء الحساب بنجاح',
            backgroundColor: Colors.green,
          );
        } else if (state is SignupErrorState) {
          Fluttertoast.showToast(
            msg: state.error,
            backgroundColor: Colors.red,
          );
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<SignupCubit>();
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
    
                        PolicesWidget(),
                      ],
                    ),
                  ),
                  // SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      text: 'إنشاء حساب جديد',
                      fSize: 18,
                      onPressed: () async {
                        if (cubit.formkey.currentState!.validate()) {
                          await cubit.userSignupWithEmailAndPassword(
                            email: cubit.emailcontroller.text,
                            password: cubit.passcontroller.text, name: cubit.namecontroller.text,
                          );
    
                          // Handle login
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 32),
                  have_an_account_widget(),
                  SizedBox(height: 42),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

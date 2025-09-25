import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/AuthAppbar.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/usecases/Google_Signin.dart';
import 'package:fruits_hub/features/auth/domain/usecases/facebookSignin.dart';
import 'package:fruits_hub/features/auth/domain/usecases/signin_user.dart';
import 'package:fruits_hub/features/auth/domain/usecases/signout.dart';
import 'package:fruits_hub/features/auth/presentation/SigninCubit/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/signupcubit/signup_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/view/verification.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const routeName = 'ForgetPassword';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        SigninUser( AuthRepoImpl()),
        SigninWithGoogle( AuthRepoImpl()),
        Signout( AuthRepoImpl()),  
        FacebookSignin( AuthRepoImpl()),
      ),
      child: BlocConsumer<SigninCubit, Signinstate>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          // var cubit = SigninCubit().get(context);
          var cubit = context.read<SigninCubit>();
          return Scaffold(
            appBar: AuthAppbar(title: 'نسيان كلمة المرور', context: context),
            body: Column(
              children: [
                SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: defulttext(
                          context: context,
                    
                    data:
                        "لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق.",
                    fSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: defulitTextFormField(
                    context: context,

                    keyboardType: TextInputType.phone,
                    controller: cubit.phoneController,
                    hintText: 'رقم الهاتف',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "أدخل رقم الهاتف";
                      }
                      return null;
                    },
                    isobscure: false,
                  ),
                ),
                SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(onPressed: () {
                  Navigator.pushNamed(context, VerificationView.routeName);
                  }, text: 'إرسال',fSize: 20,),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

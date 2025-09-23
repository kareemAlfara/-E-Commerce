import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart' show Fluttertoast;
import 'package:fruits_hub/core/services/Shared_preferences.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/AuthAppbar.dart';
import 'package:fruits_hub/core/widget/SignigContainer.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/usecases/Google_Signin.dart';
import 'package:fruits_hub/features/auth/domain/usecases/signin_user.dart';
import 'package:fruits_hub/features/auth/domain/usecases/signout.dart';
import 'package:fruits_hub/features/auth/presentation/SigninCubit/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/view/signupView.dart';
import 'package:fruits_hub/features/home/presentation/view/home.dart';
import 'package:fruits_hub/features/home/presentation/view/mainView.dart';
import 'package:svg_flutter/svg.dart';

import '../../domain/usecases/facebookSignin.dart';
import 'forgetPassword.dart';

class Signinview extends StatelessWidget {
  const Signinview({super.key});
  static const routeName = 'signin';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        SigninUser(AuthRepoImpl()),
        SigninWithGoogle(AuthRepoImpl()),
        Signout(AuthRepoImpl()),
        FacebookSignin(AuthRepoImpl()),
      ),
      child: BlocConsumer<SigninCubit, Signinstate>(
        listener: (context, state) async{
          if (state is GoogleSigninLoadingState|| state is FacebookSigninLoadingState) {
            Fluttertoast.showToast(
              msg: 'جاري إنشاء الحساب',
              backgroundColor: Colors.amber,
            );
          } else if (state is GoogleSigninSuccessState ||
              state is SigninSuccessState || state is FacebookSigninSuccessState) {
            await Prefs.saveUserIdToPrefs();
            await Prefs.saveUsernameToPrefs();

            Fluttertoast.showToast(
              msg: 'تم إنشاء الحساب بنجاح',
              backgroundColor: Colors.green,
            );
              Navigator.pushReplacementNamed(context, Mainview.routeName);
          } else if (state is GoogleSigninFailureState) {
            Fluttertoast.showToast(
              msg: state.error,
              backgroundColor: Colors.red,
            );
            
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          // var cubit = SigninCubit().get(context);
          var cubit = context.read<SigninCubit>();
          return Scaffold(
            appBar: AuthAppbar(title: 'تسجيل الدخول', context: context),
            body: SingleChildScrollView(
              child: Form(
                key: cubit.formkey,
                child: Column(
                  children: [
                    SizedBox(height: 22),
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                ForgetPasswordView.routeName,
                              );
                            },
                            child: defulttext(
                              data: 'نسيت كلمة المرور؟',
                              color: AppColors.lightPrimaryColor,
                              fw: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        text: 'تسجيل الدخول',
                        fSize: 18,
                        onPressed: () {
                          if (cubit.formkey.currentState!.validate()) {
                            // Handle login
                            cubit.userSigninWithEmailAndPassword(
                              email: cubit.emailcontroller.text,
                              password: cubit.passcontroller.text,
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        defulttext(
                          data: 'لا تمتلك حساب؟ ',
                          fSize: 16,
                          color: Colors.grey,
                          fw: FontWeight.w600,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(
                              context,
                              Signupview.routeName,
                            );
                          },
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: defulttext(
                            data: 'قم بإنشاء حساب',
                            fSize: 16,
                            color: AppColors.lightPrimaryColor,
                            fw: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          color: Colors.grey,
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                        defulttext(
                          data: 'أو',
                          fSize: 16,
                          color: Colors.black,
                          fw: FontWeight.w600,
                        ),
                        Container(
                          color: Colors.grey,
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ],
                    ),
                    SizedBox(height: 11),
                    GestureDetector(
                      onTap: () {
                        cubit.signInWithGoogle();
                      },
                      child: sgininContainer(
                        icon: Assets.imagesGoogleIcon,
                        text: 'تسجيل  بواسطة جوجل',
                      ),
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: sgininContainer(
                        icon: Assets.imagesApplIcon,
                        text: 'تسجيل  بواسطة أبل',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cubit.signInWithFacebook();
                      },
                      child: sgininContainer(
                        icon: Assets.imagesFacebookIcon,
                        text: 'تسجيل  بواسطة فيسبوك',
                      ),
                    ),
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

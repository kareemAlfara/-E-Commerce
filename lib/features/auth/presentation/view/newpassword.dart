import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/AuthAppbar.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/usecases/facebookSignin.dart';
import 'package:fruits_hub/features/auth/domain/usecases/signin_user.dart';
import 'package:fruits_hub/features/auth/presentation/SigninCubit/signin_cubit.dart';
import 'package:svg_flutter/svg_flutter.dart';
import '../../domain/usecases/Google_Signin.dart';
import '../../domain/usecases/signout.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});
  static const routeName = 'NewPassword';
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
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          // var cubit = SigninCubit().get(context);
          var cubit = context.read<SigninCubit>();
          return Scaffold(
            appBar: AuthAppbar(title: ' كلمة مرور جديدة', context: context),
            body: SingleChildScrollView(
              child: Form(
                key: cubit.formkey,
                child: Column(
                  children: [
                    SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: defulitTextFormField(
                    context: context,

                        controller: cubit.passcontroller,
                        hintText: 'كلمة المرور',
                        isobscure: cubit.Newpasswordissecure1,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "أدخل كلمة المرور";
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changeNewpassword1icon();
                          },

                          icon: cubit.Newpasswordissecure1
                              ? Icon(Icons.visibility, color: Colors.grey)
                              : Icon(Icons.visibility_off, color: Colors.grey),
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: defulitTextFormField(
                    context: context,

                        controller: cubit.passcontroller,
                        hintText: 'تاكيد كلمة المرور ',
                        isobscure: cubit.Newpasswordissecure2,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "أدخل كلمة المرور";
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          onPressed: () {
                            cubit.changeNewpassword2icon();
                          },

                          icon: cubit.Newpasswordissecure2
                              ? Icon(Icons.visibility, color: Colors.grey)
                              : Icon(Icons.visibility_off, color: Colors.grey),
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                    ),

                    SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        text: 'إنشاء كلمة مرور جديدة',
                        fSize: 18,
                        onPressed: () {
                          if (cubit.formkey.currentState!.validate()) {
                            // Handle login
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                title: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: Stack(
                                    children: [
                                      SvgPicture.asset(
                                        Assets.imagesSplashBottom,
                                      ),
                                      Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green.withOpacity(
                                              0.6,
                                            ),
                                          ),
                                          padding: const EdgeInsets.all(20),
                                          child: SvgPicture.asset(
                                            Assets.imagesCheck,
                                            width: 70,
                                            height: 50,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: defulttext(
                                    context: context,

                                    data: "تم تغيير كلمة المرور بنجاح",
                                    fSize: 18,
                                    fw: FontWeight.w700,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 22),
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

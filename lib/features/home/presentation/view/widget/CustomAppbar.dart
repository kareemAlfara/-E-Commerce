import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/usecases/Google_Signin.dart';
import 'package:fruits_hub/features/auth/domain/usecases/facebookSignin.dart';
import 'package:fruits_hub/features/auth/domain/usecases/signin_user.dart';
import 'package:fruits_hub/features/auth/domain/usecases/signout.dart';
import 'package:fruits_hub/features/auth/presentation/SigninCubit/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/view/signinView.dart';
import 'package:svg_flutter/svg.dart';

import '../../Cartcubit/cart_cubit.dart';

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({super.key});

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
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = context.read<SigninCubit>();
          String name = 'Gester';
          if (state is SigninSuccessState) {
            name = state.user.name;
          } else if (state is GoogleSigninSuccessState) {
            name = state.user.name;
          } else if (state is FacebookSigninSuccessState) {
            name = state.user.name;
          }

          return Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(Assets.imagesProfileImage),
              ),
              SizedBox(width: 6),
              Column(
                children: [
                  defulttext(
                    context: context,

                    data: "صباح الخير !..",
                    fSize: 17,
                    color: Colors.grey[600],
                    fw: FontWeight.w600,
                  ),
                  SizedBox(height: 3),
                  FutureBuilder<String>(
                    future: cubit.getusername(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return defulttext(
                          context: context,

                          data: "...",
                          fSize: 19,
                          fw: FontWeight.w600,
                        );
                      }
                      if (snapshot.hasData) {
                        return defulttext(
                          context: context,

                          data: snapshot.data!,
                          fSize: 19,
                          fw: FontWeight.w600,
                        );
                      }
                      return defulttext(
                        context: context,

                        data: "ضيف جديد",
                        fSize: 19,
                        fw: FontWeight.w600,
                      );
                    },
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () async {
                  await cubit.signOut();
                  context.read<CartCubit>().allcartEntiy.cartlist.clear();
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(Signinview.routeName);
                  // Handle notification tap
                },
                child: SvgPicture.asset(
                  Assets.imagesNotification,
                  fit: BoxFit.fill,
                  height: 30,
                  width: 30,
                ),
              ),

              SizedBox(width: 10),
            ],
          );
        },
      ),
    );
  }
}

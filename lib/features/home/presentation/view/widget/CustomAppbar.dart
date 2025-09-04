import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/auth/data/models/usersModel.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/usecases/Google_Signin.dart';
import 'package:fruits_hub/features/auth/domain/usecases/facebookSignin.dart';
import 'package:fruits_hub/features/auth/domain/usecases/signin_user.dart';
import 'package:fruits_hub/features/auth/domain/usecases/signout.dart';
import 'package:fruits_hub/features/auth/presentation/SigninCubit/signin_cubit.dart';
import 'package:fruits_hub/features/auth/presentation/view/signinView.dart';
import 'package:svg_flutter/svg.dart';

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
          Usersmodel ?usersmodel;
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
                    data: "صباح الخير !..",
                    fSize: 17,
                    color: Colors.grey[600],
                    fw: FontWeight.w600,
                  ),
                  SizedBox(height: 3),
                  defulttext(
                    data: "محمود صالخ",
                    fSize: 19,
                    fw: FontWeight.w600,
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () async {
                  await cubit.signOut();
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

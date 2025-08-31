import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

import '../../domain/usecases/signup_user.dart';
import 'widget/signupWidget.dart';

class Signupview extends StatelessWidget {
  const Signupview({super.key});
  static const routeName = 'Signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        SignupUser(AuthRepoImpl()),
      ),
      child: SignupbodyWidget(),
    );
  }
}

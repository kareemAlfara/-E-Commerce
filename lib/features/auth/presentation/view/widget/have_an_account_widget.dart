import "package:flutter/material.dart";
import "package:fruits_hub/core/utils/app_colors.dart";
import "package:fruits_hub/core/utils/components.dart";
import "../signinView.dart";
class have_an_account_widget extends StatelessWidget {
  const have_an_account_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        defulttext(
                          context: context,

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
                          context: context,

            data: 'تسجيل الدخول',
            fSize: 16,
            color: AppColors.lightPrimaryColor,
            fw: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

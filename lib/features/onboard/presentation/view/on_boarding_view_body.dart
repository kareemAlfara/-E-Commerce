import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/onboard/presentation/view/widget/onboard_pageview.dart';

class on_boarding_view_body extends StatefulWidget {
  const on_boarding_view_body({super.key});

  @override
  State<on_boarding_view_body> createState() => _on_boarding_view_bodyState();
}

class _on_boarding_view_bodyState extends State<on_boarding_view_body> {
  late PageController pageController;

  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    // TODO: implement initState
    super.initState();
  }

  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: OnboardPageview(pageController: pageController)),
          DotsIndicator(
            dotsCount: 2,
            decorator: DotsDecorator(
              activeColor: AppColors.primaryColor,
              color: currentPage == 1
                  ? AppColors.primaryColor
                  : AppColors.primaryColor.withOpacity(.5),
            ),
          ),
            const SizedBox(
          height: 29,
        ),
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: CustomButton(
              onPressed: () {
                // Prefs.setBool(kIsOnBoardingViewSeen, true);
                // Navigator.of(context).pushReplacementNamed(
                //   SigninView.routeName,
                // );
              },
              text: 'ابدأ الان',
            ),
          ),
        ),
        SizedBox(height: 22,),
        ],
      ),
    );
  }
}

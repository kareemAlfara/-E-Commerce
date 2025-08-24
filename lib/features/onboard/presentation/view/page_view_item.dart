import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:svg_flutter/svg.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key, required this.backgroundImage, required this.foregroundImage, required this.title, required this.subtitle});
  static const routeName = 'onboarding';
  final String backgroundImage;
  final String foregroundImage;
  final Widget title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SvgPicture.asset(Assets.imagesPageViewItem1BackgroundImage),
                SvgPicture.asset(Assets.imagesPageViewItem1Image),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              defulttext(
                data: 'مرحباً بكم في ',
                color: Colors.black,
                fSize: 28,
                fw: FontWeight.w700,
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "Fruit",
                      style: TextStyle(color: Colors.green[800]),
                    ),
                    TextSpan(
                      text: "HUB",
                      style: TextStyle(color: Colors.orange[700]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 22),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: defulttext(
              data:
                  'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
              fSize: 17,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

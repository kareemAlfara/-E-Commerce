import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/onboard/presentation/view/widget/page_view_item.dart';

class OnboardPageview extends StatelessWidget {
  const OnboardPageview({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        page_view_item(
          isVisible: true,
          backgroundImage: Assets.imagesPageViewItem1BackgroundImage,
         foregroundImage: Assets.imagesPageViewItem1Image,
          title:   Row(
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
          subtitle:   'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',)
    ,  page_view_item(
      isVisible: false,
      backgroundImage: Assets.imagesPageViewItem2BackgroundImage,
         foregroundImage: Assets.imagesPageViewItem2Image,
          title:   Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              defulttext(
                data: 'ابحث وتسوق',
                color: Colors.black,
                fSize: 28,
                fw: FontWeight.w700,
              ),
            
            ],
          ), 
          subtitle:   'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',)
    
    
      ],
    );
  }
}
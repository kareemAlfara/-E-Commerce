import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:svg_flutter/svg.dart';

class page_view_item extends StatelessWidget {
  const page_view_item({super.key, required this.backgroundImage, required this.foregroundImage, required this.title, required this.subtitle, required this.isVisible});
  final String backgroundImage;
  final String foregroundImage;
  final Widget title;
  final String subtitle;
final bool isVisible;
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
                SvgPicture.asset(backgroundImage),
                SvgPicture.asset(foregroundImage),
                  Positioned(
                    top: 22,
                    right: 22,
                    child: Visibility(
                                    visible: isVisible,
                                    child: GestureDetector(
                    onTap: () {
                      // Prefs.setBool(kIsOnBoardingViewSeen, true);
                    
                      // Navigator.of(context).pushReplacementNamed(
                      //   SigninView.routeName,
                      // );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: defulttext(
                                    data:       'تخط',
                      
                          color:  Colors.red,
                        
                      ),
                    ),
                                    ),
                                  ),
                  )
              ],
              
            ),
          ),
          SizedBox(height: 20),
        title,
          SizedBox(height: 22),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: defulttext(
              data:
                subtitle,
              fSize: 17,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

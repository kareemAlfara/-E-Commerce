import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:svg_flutter/svg_flutter.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context, title: "الإشعارات"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  defulttext(data: "جديد ", fSize: 16, fw: FontWeight.w500),
                  CircleAvatar(
                    backgroundColor: Colors.tealAccent.withOpacity(0.5),
                    radius: 12,
                    child: defulttext(data: "2", fSize: 14, fw: FontWeight.w500),
                  ),
                  Spacer(),
                  defulttext(
                    data: " تحديد كل مقروء",
                    fSize: 16,
                    fw: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(Assets.imagesProfileImage),
                      radius: 30,
                    ),
                    SizedBox(width: 12),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: defulttext(
                        data: "خصم 50% علي اسعار الفواكه بمناسبه العيد",
                      ),
                    ),
                    Spacer(),
                    
                    defulttext(
                      data: " 3 صباحاً",
                      fSize: 16,
                      fw: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => SizedBox(height: 14),
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

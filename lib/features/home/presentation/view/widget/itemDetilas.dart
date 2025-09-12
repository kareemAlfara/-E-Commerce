import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ItemDetilas extends StatelessWidget {
  const ItemDetilas({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.id,
  });
  final int id;
  final String title;
  final num price;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF3F5F7),
        leading: Container(
          padding: const EdgeInsets.all(0),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/cartitembackground.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(70.0),
                  child: Image.network(image, fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defulttext(data: title, fSize: 16, fw: FontWeight.bold),
                        SizedBox(height: 10),
                        defulttext(
                          data: "${price} حنية /الكيلو" as String,
                          fSize: 14,
                          color: Colors.amber,
                          fw: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Spacer(),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                              final prefs = await SharedPreferences.getInstance();
                            final userId = prefs.getString('user_id');
                            final username = prefs.getString('username');
                          log(username.toString());
                          log(userId.toString());
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: const Color(0xFF4CAF50),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        defulttext(data: "4", fSize: 20, fw: FontWeight.w800),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 50),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(Assets.imagestar),
                    SizedBox(width: 4),
                    defulttext(data: "4.5", fSize: 16, fw: FontWeight.bold),
                    SizedBox(width: 10),

                    defulttext(
                      data: "(+20)",
                      color: Colors.grey,
                      fSize: 16,
                      fw: FontWeight.bold,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "للمراجعة",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: defulttext(color: Colors.grey, data: description),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    itemDetilesContainer(
                      title: "عام",
                      Suptitle: " الصلاحية",
                      image: Assets.imageGroup1,
                    ),
                    itemDetilesContainer(
                      title: "100%",
                      Suptitle: " اورجانيك",
                      image: Assets.imageGroup2,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    itemDetilesContainer(
                      title: "80 كالوري",
                      Suptitle: " 100 جرام",
                      image: Assets.imageGroup3,
                    ),
                    GestureDetector(
                      onTap: () =>
                          navigat(context, widget: reviewView(product_id: id)),
                      child: itemDetilesContainer(
                        title: "4.8",
                        Suptitle: " التقييم",
                        image: Assets.imageGroup4,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(onPressed: () {}, text: "أضف الي السلة"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class itemDetilesContainer extends StatelessWidget {
  const itemDetilesContainer({
    super.key,
    required this.title,
    required this.Suptitle,
    required this.image,
  });
  final String title;
  final String Suptitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      // padding: const EdgeInsets.symmetric(horizontal: 28.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.of(context).size.width * 0.4,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                defulttext(
                  data: title,
                  fSize: 16,
                  fw: FontWeight.bold,
                  color: AppColors.lightPrimaryColor,
                ),
                SizedBox(height: 10),
                defulttext(
                  data: Suptitle,
                  fSize: 14,
                  fw: FontWeight.w500,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SvgPicture.asset(image)],
            ),
          ],
        ),
      ),
    );
  }
}

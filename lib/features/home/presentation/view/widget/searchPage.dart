import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/HomeSearchWidget.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/searchConatiner.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context, title: "البحث"),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              SearchConatinerWidget(),
        
              // SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  height: 100,
                  width: double.infinity,
                  child: defulttext(
                    data: " لا يوجد نتائج بحث",
                    fSize: 18,
                    fw: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 77),
              Image.asset(Assets.search),
              SizedBox(height: 20),
        
              defulttext(data: "البحث", fSize: 17, fw: FontWeight.w600),
              SizedBox(height: 10),
        
              defulttext(
                data: "عفوا هذه المعلومات غير متوفره اللحظه",
                color: Colors.grey,
                fSize: 17,
                fw: FontWeight.w600,
              ),
              SizedBox(height: 40),
        
            ],
          ),
        ),
      ),
    );
  }
}

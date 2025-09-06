import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/FeatureList.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/HomeSearchWidget.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/custom_bottom_navigation_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/ourProductswidget.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/ourproductListview.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/productGridView.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/prouductbottomsheet.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/searchPage.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/themostSale.dart';
import 'package:svg_flutter/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
class productBody extends StatelessWidget {
  const productBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: defaultAppBar(
        automaticallyImplyLeading: false,
        context: context,
        title: 'المنتجات',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
    
              GestureDetector(
                onTap: () {
                  navigat(context, widget: Searchpage());
                },
                child: HomeSearchWidget(),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 14,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    defulttext(
                      data: "منتجاتنا",
                      color: Colors.black,
                      fw: FontWeight.w500,
                      fSize: 17,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Prouductbottomsheet(),
                        );
                      },
                      child: Container(
                        width: 50,
                        height: 40,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(
                          Assets.imagesFilter2,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ourproductListview(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    defulttext(
                      data: "الأكثر مبيعاً",
                      color: Colors.black,
                      fw: FontWeight.bold,
                      fSize: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, TheMostSale.routeName);
                      },
                      child: defulttext(
                        data: "المزيد",
                        color: Colors.grey,
                        fSize: 18,
                        fw: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              productGridView(),
            ],
          ),
        ),
      ),
    );
  }
}

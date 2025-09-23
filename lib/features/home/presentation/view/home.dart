import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/home/data/repo_impl/Product_repo_impl.dart';
import 'package:fruits_hub/features/home/domain/usecases/addfavoriteusecase.dart';
import 'package:fruits_hub/features/home/domain/usecases/getBestSellingUsecase.dart';
import 'package:fruits_hub/features/home/domain/usecases/getproductUsecase.dart';
import 'package:fruits_hub/features/home/presentation/productcubit/product_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/FeatureList.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/HomeSearchWidget.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/bestSellingGridview.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/custom_bottom_navigation_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/productGridView.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/searchPage.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/themostSale.dart';
import 'widget/CustomAppbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomAppbarWidget(),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  navigat(context, widget: Searchpage());
                },
                child: HomeSearchWidget(),
              ),
              // SizedBox(height: 10),
              FeatureList(),

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
                    BlocConsumer<ProductCubit, ProductState>(
                      listener: (context, state) {
                        var cubit = context.read<ProductCubit>();
                    
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              TheMostSale.routeName,
                            );
                          },
                          child: defulttext(
                            data: "المزيد",
                            color: Colors.grey,
                            fSize: 18,
                            fw: FontWeight.w500,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              bestSellingGridview(),
            ],
          ),
        ),
      ),
    );
  }
}

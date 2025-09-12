import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/home/data/repo_impl/Product_repo_impl.dart';
import 'package:fruits_hub/features/home/domain/entites/cartEntity.dart';
import 'package:fruits_hub/features/home/domain/usecases/getBestSellingUsecase.dart';
import 'package:fruits_hub/features/home/domain/usecases/getproductUsecase.dart';
import 'package:fruits_hub/features/home/presentation/productcubit/product_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/cardWidget.dart';
import 'package:svg_flutter/svg.dart';

class CartView extends StatelessWidget {
  const CartView({super.key, required this.cartItems});
final List<Cartentity> cartItems;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        Getproductusecase(ProductRepoImpl()),
        Getbestsellingusecase(ProductRepoImpl()),
      ),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
                appBar: defaultAppBar(
                  context: context,
                  title: 'السلة',
                  isShowActions: false,
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:  8.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        color: Color(0xFFEBF9F1),
          
                        child: Center(
                          child: defulttext(data: "لديك 3 منتجات في سلة التسوق"),
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded( 
                        child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>  CardWidget(product:cartItems[index] ,) ,
                         separatorBuilder: (context, index) => SizedBox(height: 10), itemCount: cartItems.length),
                      ),
                      SizedBox(height: 22,),
                      CustomButton(onPressed: () {
                        
                      }, text: "ادفع 120 جنية", fSize: 17,),
                    
                    ],
                  ),
                ),
              );
        },
      ),
    );
  }
}
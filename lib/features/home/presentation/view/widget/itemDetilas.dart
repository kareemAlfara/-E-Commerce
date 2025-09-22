import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/home/data/repo_impl/Product_repo_impl.dart';
import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';
import 'package:fruits_hub/features/home/domain/usecases/getBestSellingUsecase.dart';
import 'package:fruits_hub/features/home/domain/usecases/getproductUsecase.dart';
import 'package:fruits_hub/features/home/presentation/Cartcubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/productcubit/product_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/review.dart';

import 'package:svg_flutter/svg_flutter.dart';

class ItemDetilas extends StatelessWidget {
  const ItemDetilas({super.key, required this.product});
  final Productsentities product;

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
                          image: AssetImage(
                            "assets/images/cartitembackground.png",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(70.0),
                        child: Image.network(product.image, fit: BoxFit.fill),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              defulttext(
                                data: product.name,
                                fSize: 16,
                                fw: FontWeight.bold,
                              ),
                              SizedBox(height: 10),
                              defulttext(
                                data: "${product.price} حنية /الكيلو" as String,
                                fSize: 14,
                                color: Colors.amber,
                                fw: FontWeight.bold,
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Spacer(),

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
                          defulttext(
                            data: "${product.avgRating}",
                            fSize: 16,
                            fw: FontWeight.bold,
                          ),
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
                      child: defulttext(
                        color: Colors.grey,
                        data: product.description,
                      ),
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
                          product.isorginic
                              ? itemDetilesContainer(
                                  title: "100%",
                                  Suptitle: " اورجانيك",
                                  image: Assets.imageGroup2,
                                )
                              : SizedBox(
                                  child: Container(
                                    height: 80,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                  ),
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
                            title: "${product.numberofCaluries} كالوري",
                            Suptitle: " 100 جرام",
                            image: Assets.imageGroup3,
                          ),
                          GestureDetector(
                            onTap: () => navigat(
                              context,
                              widget: reviewView(product_id: product.id),
                            ),
                            child: itemDetilesContainer(
                              title: "${product.avgRating}",
                              Suptitle: " التقييم",
                              image: Assets.imageGroup4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        onPressed: () {
                          context.read<CartCubit>().addproduct(product);
                          Navigator.pop(context);
                          // Navigator.pushAndRemoveUntil(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Mainviewbolcconsumer(),
                          //   ), // Replace with your actual main view class
                          //   (route) => false,
                          // );
                          // Optional: Show a snackbar to confirm addition
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("تم إضافة المنتج إلى السلة"),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                        text: "أضف الي السلة",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
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
                GestureDetector(
                  onTap: () {},
                  child: defulttext(
                    data: title,
                    fSize: 16,
                    fw: FontWeight.bold,
                    color: AppColors.lightPrimaryColor,
                  ),
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

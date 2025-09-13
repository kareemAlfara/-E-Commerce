import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/home/domain/entites/cartEntity.dart';
import 'package:fruits_hub/features/home/presentation/Cartcubit/cart_cubit.dart';
import 'package:svg_flutter/svg.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.product});
  final Cartentity product;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Container(
          height: 90,
          padding: EdgeInsets.all(5),
          color: Colors.grey[200],
          child: Image.network(product.product.image, height: 70, width: 60),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              height: 94,

              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        defulttext(
                          data: product.product.name,
                          color: Colors.black,
                          fw: FontWeight.bold,
                          fSize: 16,
                        ),
                        defulttext(
                          data: "${product.gettotalWight()}كم ",
                          color: Colors.amber,
                          fw: FontWeight.bold,
                          fSize: 16,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.read<CartCubit>().addproduct(
                                  product.product,
                                );
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
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        defulttext(
                          data: product.quantity.toString(),
                          fSize: 18,
                          fw: FontWeight.w800,
                        ),
                      ],
                    ),
                    SizedBox(width: 5),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                                context.read<CartCubit>().decrease(
                                  product.product,
                                );
                          },
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
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().deleteCart(product);

                            Fluttertoast.showToast(
                              msg: "تم حذف المنتج بنجاح",
                              backgroundColor: Colors.green,
                            );
                          },
                          child: SvgPicture.asset(
                            Assets.imagesTrash,
                            height: 20,
                            width: 20,
                            color: Colors.red,
                          ),
                        ),

                        defulttext(
                          data: "${product.grtprice()} جنية",
                          fSize: 17,
                          fw: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ],
                    ),

                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.5,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/home/data/models/productmodel.dart';
import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';
import 'package:fruits_hub/features/home/presentation/Cartcubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/itemDetilas.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/ourProductswidget.dart';

class productItem extends StatelessWidget {
  const productItem({super.key, required this.model});
  final Productsentities model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        color: Colors.grey[100],
        padding: EdgeInsets.all(11),
        width: MediaQuery.sizeOf(context).width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
            GestureDetector(
              onTap: () {
                navigat(
                  context,
                  widget: ItemDetilas(
                    id: model.id,
                    title: model.name,
                    price: model.price,
                    description: model.description,
                    image: model.image,
                  ),
                );
              },
              child: Center(
                child: Image.network(
                  model.image,
                  fit: BoxFit.fill,
                  height: 130,
                ),
              ),
            ),
            // SizedBox(height: 12),
            defulttext(
              data: model.name,
              color: Colors.black,
              fw: FontWeight.bold,
              fSize: 16,
            ),
            // SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                defulttext(
                  data: " ${model.price} جنيه / الكيلو",
                  color: Colors.orange[500],
                  fw: FontWeight.bold,
                  fSize: 13,
                ),
                CircleAvatar(
                  backgroundColor: AppColors.lightPrimaryColor,
                  child: IconButton(
                    onPressed: () {
                      context.read<CartCubit>().addproduct(model);
                
                    },
                    icon: Icon(Icons.add),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

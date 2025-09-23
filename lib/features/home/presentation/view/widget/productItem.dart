import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/home/data/models/productmodel.dart';
import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';
import 'package:fruits_hub/features/home/presentation/Cartcubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/productcubit/product_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/itemDetilas.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/ourProductswidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            favoriteiconWidget(product_id: model.id),
            GestureDetector(
              onTap: () {
                navigat(context, widget: ItemDetilas(product: model));
              },
              child: Center(
                child: model.image != null
                    ? Image.network(model.image, fit: BoxFit.fill, height: 130)
                    : Container(color: Colors.grey, height: 100, width: 100),
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

class favoriteiconWidget extends StatefulWidget {
  const favoriteiconWidget({super.key, required this.product_id});
  final int product_id;

  @override
  State<favoriteiconWidget> createState() => _favoriteiconWidgetState();
}

class _favoriteiconWidgetState extends State<favoriteiconWidget> {
  String? userId;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('user_id');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final cubit = context.read<ProductCubit>();
        final isFav = cubit.isFavorite(widget.product_id);

        return IconButton(
          onPressed: userId == null
              ? null
              : () {
                  cubit.toggleFavorite(
                    productId: widget.product_id,
                    userId: userId!,
                  );
                },
          icon: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: isFav ? Colors.red : null,
          ),
        );
      },
    );
  }
}

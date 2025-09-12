import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/data/repo_impl/Product_repo_impl.dart';
import 'package:fruits_hub/features/home/domain/usecases/getBestSellingUsecase.dart';
import 'package:fruits_hub/features/home/domain/usecases/getproductUsecase.dart';
import 'package:fruits_hub/features/home/presentation/productcubit/product_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/productItem.dart';

class productGridView extends StatelessWidget {
  const productGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductCubit(Getproductusecase(ProductRepoImpl()),
          Getbestsellingusecase(ProductRepoImpl()),
          )..getAllproduct(),

      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = context.read<ProductCubit>();
          return DynamicHeightGridView(
            physics:
                const NeverScrollableScrollPhysics(), // Disable inner scrolling
            shrinkWrap: true, // Important: makes grid take only needed space

            builder: (context, index) =>
                productItem(model: cubit.product[index]),
            itemCount: cubit.product.length,
            crossAxisCount: 2,
          );
        },
      ),
    );
  }
}

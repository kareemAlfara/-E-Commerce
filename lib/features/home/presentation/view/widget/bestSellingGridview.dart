import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/get_dummy_product.dart';
import 'package:fruits_hub/features/home/data/repo_impl/Product_repo_impl.dart';
import 'package:fruits_hub/features/home/domain/usecases/addfavoriteusecase.dart';
import 'package:fruits_hub/features/home/domain/usecases/getBestSellingUsecase.dart';
import 'package:fruits_hub/features/home/domain/usecases/getproductUsecase.dart';
import 'package:fruits_hub/features/home/presentation/productcubit/product_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/productGridView.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/productItem.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/shimmer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class bestSellingGridview extends StatelessWidget {
  const bestSellingGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        Getproductusecase(ProductRepoImpl()),
        Getbestsellingusecase(ProductRepoImpl()),
        GetFavoriteProductsUsecase( ProductRepoImpl()),
        Addfavoriteusecase(ProductRepoImpl()),
        
      )..Getbestselling(),

      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is getbestsellingloadingstate) {}
          // TODO: implement listener
        },
        builder: (context, state) {

          var cubit = context.read<ProductCubit>();
    if (state is getbestsellingloadingstate) {
  return Skeletonizer(
    enabled: true,
    child: DynamicHeightGridView(
      physics: const NeverScrollableScrollPhysics(), // Disable inner scrolling
      shrinkWrap: true, // Important: makes grid take only needed space
      builder: (context, index) => productItem(model: getDummyProduct()),
      itemCount: 6,
      crossAxisCount: 2,
    ),
  );
} else {
            return DynamicHeightGridView(
              physics:
                  const NeverScrollableScrollPhysics(), // Disable inner scrolling
              shrinkWrap: true, // Important: makes grid take only needed space

              builder: (context, index) =>
                  productItem(model: cubit.bestselling[index]),
              itemCount: cubit.bestselling.length,
              crossAxisCount: 2,
            );
          }
          
        },
      ),
    );
  }
}

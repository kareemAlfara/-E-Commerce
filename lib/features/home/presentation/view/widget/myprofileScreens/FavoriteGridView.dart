import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/presentation/productcubit/product_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/productItem.dart';

class FavoriteGridView extends StatelessWidget {
  final String userId;
  const FavoriteGridView({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is GetFavoritesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetFavoritesSuccessState) {
          if (state.favorites.isEmpty) {
            return const Center(child: Text("No favorite products yet"));
          }
          return DynamicHeightGridView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: state.favorites.length,
            builder: (context, index) =>
                productItem(model: state.favorites[index]),
            crossAxisCount: 2,
          );
        } else if (state is GetFavoritesFailureState) {
          return Center(child: Text("Error: ${state.error}"));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
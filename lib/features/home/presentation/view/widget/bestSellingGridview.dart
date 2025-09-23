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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingGridView extends StatefulWidget {
  const BestSellingGridView({super.key});

  @override
  State<BestSellingGridView> createState() => _BestSellingGridViewState();
}

class _BestSellingGridViewState extends State<BestSellingGridView> {
  @override
  String? userId;
  Future<void> _loadUserData() async {
  final prefs = await SharedPreferences.getInstance();
  final loadedId = prefs.getString('user_id');
  setState(() {
    userId = loadedId;

  });

  if (loadedId != null && mounted) {
    context.read<ProductCubit>().loadFavorites(loadedId); // 🔹 preload
  }
}
  void initState() {
    super.initState();
    _loadUserData(); // Load user data on init
    // Trigger best-selling fetch on this page only
    context.read<ProductCubit>().Getbestselling();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final cubit = context.watch<ProductCubit>();
        if (state is getbestsellingloadingstate) {
          return Skeletonizer(
            enabled: true,
            child: DynamicHeightGridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              builder: (_, __) => productItem(model: getDummyProduct()),
              itemCount: 6,
              crossAxisCount: 2,
            ),
          );
        }
        return DynamicHeightGridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          builder: (_, i) => productItem(model: cubit.bestselling[i]),
          itemCount: cubit.bestselling.length,
          crossAxisCount: 2,
        );
      },
    );
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/home/data/models/productmodel.dart';
import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';
import 'package:fruits_hub/features/home/domain/usecases/addfavoriteusecase.dart';
import 'package:fruits_hub/features/home/domain/usecases/addreviewsusecase.dart';
import 'package:fruits_hub/features/home/domain/usecases/getBestSellingUsecase.dart';
import 'package:fruits_hub/features/home/domain/usecases/getproductUsecase.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final Getproductusecase getproductusecase;
    final Addfavoriteusecase addfavoriteusecas;
  final Getbestsellingusecase getbestsellingusecase;
  final GetFavoriteProductsUsecase getFavoriteProductsUsecase;
  ProductCubit(this.getproductusecase, this.getbestsellingusecase,
      this.getFavoriteProductsUsecase, this.addfavoriteusecas)
    : super(ProductInitial());
  List<Productsentities> product = [];
  List<Productsentities> bestselling = [];

  getAllproduct() async {
    try {
      emit(getProductloadingstate());
      product = await getproductusecase.call();
      emit(getAllproductSuccessState(products: product));
    } on Exception catch (e) {
      emit(getAllproductFailureState(error: e.toString()));
    }
  }
Future<void> GetFavorites(String userId) async {
  try {
    emit(GetFavoritesLoadingState());
 final   favorites = await getFavoriteProductsUsecase.call(userId);
    emit(GetFavoritesSuccessState(favorites: favorites));
  } catch (e) {
    emit(GetFavoritesFailureState(error: e.toString()));
  }
}

  Getbestselling() async {
    try {
      emit(getbestsellingloadingstate());
      bestselling = await getbestsellingusecase.call();
      emit(getbestsellingSuccessState(products: bestselling));
    } on Exception catch (e) {
      emit(getbestsellingFailureState(error: e.toString()));
    }
  }
  
  // addfavotite({
  //   required int product_id,
  //   required String user_id,
  //   required bool isfavorite,
  // }) async {
  //   try {
  //     final addfavorite = await addfavoriteusecas(
  //       product_id: product_id,
  //       user_id: user_id,
  //       isfavorite: isfavorite,
  //     );
  //     emit(AddFavotitesuccess());
  //   } on Exception catch (e) {
  //     // TODO
  //     emit(AddFavotitefailur(error: e.toString()));
  //   }
  // }
  // bool isfavorite = false;
  // isfavoritechange() {
  //   isfavorite = !isfavorite;
  //   emit(isfavoritechangestate());
  // }
  /// store favorites state per product_id
   /// store favorites state per product_id
  final Map<int, bool> _favorites = {};

  bool isFavorite(int productId) => _favorites[productId] ?? false;

  /// 🔹 Load favorites from Supabase when app starts or page opens
  Future<void> loadFavorites(String userId) async {
    try {
      emit(GetFavoritesLoadingState());
      final favorites = await getFavoriteProductsUsecase.call(userId);

      // fill map with productId = true
      _favorites.clear();
      for (var product in favorites) {
        _favorites[product.id] = true;
      }

      emit(GetFavoritesSuccessState(favorites: favorites));
    } catch (e) {
      emit(GetFavoritesFailureState(error: e.toString()));
    }
  }

  /// 🔹 Toggle favorite and sync with Supabase
  Future<void> toggleFavorite({
    required int productId,
    required String userId,
  }) async {
    final current = _favorites[productId] ?? false;
    final newValue = !current;

    // Update locally first
    _favorites[productId] = newValue;
    emit(isfavoritechangestate());

    // Call API
    try {
      await addfavoriteusecas(
        product_id: productId,
        user_id: userId,
        isfavorite: newValue,
      );
      emit(AddFavotitesuccess());
    } catch (e) {
      // rollback on error
      _favorites[productId] = current;
      emit(AddFavotitefailur(error: e.toString()));
    }
  }
}
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/home/data/models/productmodel.dart';
import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';
import 'package:fruits_hub/features/home/domain/usecases/addreviewsusecase.dart';
import 'package:fruits_hub/features/home/domain/usecases/getBestSellingUsecase.dart';
import 'package:fruits_hub/features/home/domain/usecases/getproductUsecase.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final Getproductusecase getproductusecase;
  final Getbestsellingusecase getbestsellingusecase;
  ProductCubit(this.getproductusecase, this.getbestsellingusecase)
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

  Getbestselling() async {
    try {
      emit(getbestsellingloadingstate());
      bestselling = await getbestsellingusecase.call();
      emit(getbestsellingSuccessState(products: bestselling));
    } on Exception catch (e) {
      emit(getbestsellingFailureState(error: e.toString()));
    }
  }
}

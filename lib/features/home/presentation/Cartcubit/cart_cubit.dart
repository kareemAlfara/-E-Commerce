import 'package:bloc/bloc.dart';
import 'package:fruits_hub/features/home/domain/entites/allCartEntity.dart';
import 'package:fruits_hub/features/home/domain/entites/cartEntity.dart';
import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';
import 'package:meta/meta.dart';

import '../../domain/entites/allCartEntity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  allcartEntity allcartEntiy = allcartEntity(cartlist: []);
  void addproduct(Productsentities product) {
    try {
      bool isExist = allcartEntiy.isExist(product);
      var cartitem = allcartEntiy.getCarItem(product);
      if (isExist) {
        cartitem.increase();
      } else {
        Cartentity cartentity = Cartentity(product: product, quantity: 1);
        allcartEntiy.addcart(cartentity);
      }

      emit(addedcartsuccess());
    } on Exception catch (e) {
      // TODO
      print(e.toString());
      emit(addedcartfailure(
        error: e.toString(),
      ));
    }
  }
}

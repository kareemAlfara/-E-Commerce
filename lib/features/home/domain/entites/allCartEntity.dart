import 'package:fruits_hub/features/home/domain/entites/cartEntity.dart';
import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';


class allcartEntity  {
  final List<Cartentity> cartlist;

  allcartEntity({required this.cartlist});

  addcart(Cartentity cartentity) {
    cartlist.add(cartentity);
  }
  deletecart(Cartentity cartentity){
    cartlist.remove(cartentity);
  }
  num gettotalprice(){
  num totalprice=0;
    for (var cartitem in cartlist) {
      totalprice+= cartitem.grtprice();

    } 
    return totalprice; 
  }
  bool isExist(Productsentities product) {
    for (var cartitem in cartlist) {
      if (cartitem.product.id == product.id) {
        return true;
      }
    }
    return false;
  }
  
  Cartentity getCarItem(Productsentities product) {
    for (var carItem in cartlist) {
      if (carItem.product == product) {
        return carItem;
      }
    }
    return Cartentity(product: product, quantity: 1);
  }
}

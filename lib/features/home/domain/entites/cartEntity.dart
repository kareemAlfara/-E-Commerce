import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';

class Cartentity {
  final Productsentities product;
  final int quantity;
  Cartentity({required this.product, required this.quantity});
num   grttotalprice (){
    return product.price * quantity;
  }
num  gettotalWight(){
    return product.unitAmount * quantity;
  }
}
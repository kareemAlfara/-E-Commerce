import 'package:equatable/equatable.dart';
import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';
 
class Cartentity extends Equatable{
  final Productsentities product;
   int quantity;
  Cartentity({required this.product, required this.quantity});
num   grtprice (){
    return product.price * quantity;
  }

num  gettotalWight(){
    return product.unitAmount * quantity;
  }
  increase(){
    quantity++;
  }
  decrease(){
    quantity--;
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [product];

}
import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';

class favoritEntity {
  final int product_id;
  final String user_id;
final bool isfavorite;
  favoritEntity({
    required this.isfavorite,
   required this.product_id, required this.user_id, });

}
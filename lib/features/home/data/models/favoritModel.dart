import 'package:fruits_hub/features/home/domain/entites/favoritEntity.dart';

class Favoritmodel extends favoritEntity {
  Favoritmodel({
    required super.user_id,
    required super.product_id,
    required super.isfavorite,
  });

  factory Favoritmodel.fromJson(Map<String, dynamic> json) => Favoritmodel(
    user_id: json['user_id'],
    product_id: json['product_id'],
    isfavorite: json['isfavorite'],
  );

  favoritEntity toEntity() => favoritEntity(
    user_id: user_id,
    product_id: product_id,
    isfavorite: isfavorite,
  );
}

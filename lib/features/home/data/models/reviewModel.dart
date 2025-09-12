import 'package:fruits_hub/features/home/domain/entites/reviewEntity.dart';

class Reviewmodel extends Reviewentity {
  Reviewmodel({
    required super.descriptionmessage,
    required super.name,
    required super.product_id,
    required super.user_id,
    required super.ratingcount,
  });
  factory Reviewmodel.fromJson(Map<String, dynamic> json) {
    return Reviewmodel(
      descriptionmessage: json['descriptionmessage'],
      name: json['name'],
      product_id: json['product_id'],
      user_id: json['user_id'],
      ratingcount: json['ratingcount'],
    );
  }
  Reviewentity toEntity() => Reviewentity(
        descriptionmessage: descriptionmessage,
        name: name,
        product_id: product_id,
        user_id: user_id,
        ratingcount: ratingcount,
      );
}

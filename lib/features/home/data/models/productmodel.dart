import 'package:fruits_hub/core/helper_functions/get_avg_rating.dart';
import 'package:fruits_hub/features/home/data/models/reviewModel.dart';
import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';

class Productmodel {
  final int id;
  final String name;
  final num price;
  final num avgRating;
  final num numberofCaluries;
  final bool isorginic;

  final num sellingCount;
  final num unitAmount;
  final String description;
  final String image;
  final String code;
  final List<Reviewmodel> reviews;
  Productmodel({
    required this.avgRating,
    required this.numberofCaluries,
    required this.isorginic,
    required this.unitAmount,
    required this.sellingCount,
    required this.reviews,
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.code,
  });
  Productsentities toEntity() {
    return Productsentities(
      id: id,
      numberofCaluries: numberofCaluries,
      avgRating: avgRating,
      isorginic: isorginic,
      unitAmount: unitAmount,
      name: name,
      price: price,
      description: description,
      image: image,
      code: code,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  factory Productmodel.fromJson(Map<String, dynamic> json) {
    return Productmodel(
      sellingCount: json["sellingCount"],
      numberofCaluries: json["numberofCaluries"],
      isorginic: json["isorginic"],
      unitAmount: json["unitAmount"],
      avgRating: getAvgRating(
        json['reviews'] != null
            ? List<Reviewmodel>.from(
                json['reviews'].map((e) => Reviewmodel.fromJson(e)),
              )
            : [],
      ),
      id: json['id'],
      reviews: json['reviews'] == null
          ? []
          : List<Reviewmodel>.from(
              json['reviews'].map((e) => Reviewmodel.fromJson(e)),
            ),
      name: json['productname'],
      price: json['productprice'],
      description: json['description'],
      image: json['productimage'],
      code: json['productcode'],
    );
  }
}

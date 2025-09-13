import 'package:equatable/equatable.dart';
import 'package:fruits_hub/features/home/data/models/reviewModel.dart';
import 'package:fruits_hub/features/home/domain/entites/reviewEntity.dart';

class Productsentities extends Equatable {
  final int id;
  final String name;
  final num price;
  final String description;
  final String image;
  final String code;
  final num unitAmount;
final List<Reviewentity>reviews;
  // File? fileFile;

  Productsentities( {

    required this.reviews,
    required this.unitAmount,
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [code,name];
}

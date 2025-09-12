import 'package:fruits_hub/features/home/data/models/productmodel.dart';
import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';
import 'package:fruits_hub/features/home/domain/entites/reviewEntity.dart';

abstract class ProductRepo {
  
  Future<List<Productsentities>> getProducts();
  Future<List<Productsentities>> getBestSellingProducts();
  Future<Reviewentity> addreviews(
    {  required String descriptionmessage,
  required String name,
  required int product_id,
  required String user_id,
  required num ratingcount,}
  );
}

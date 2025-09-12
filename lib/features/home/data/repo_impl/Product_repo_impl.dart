import 'package:fruits_hub/features/home/data/models/reviewModel.dart';
import 'package:fruits_hub/features/home/data/repo/product_repo.dart';
import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';
import 'package:fruits_hub/features/home/domain/entites/reviewEntity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/productmodel.dart';

class ProductRepoImpl implements ProductRepo{
  @override
    Future<List<Productsentities>> getProducts() async {
    try {
      final response = await Supabase.instance.client
          .from('products')
          .select()
          .order('created_at', ascending: false);
      
      if (response.isEmpty) {
        print("No products found in database");
        return [];
      }

      List<Productsentities> products = [];
      for (var row in response) {
        try {
          products.add(Productmodel.fromJson(row).toEntity());
        } catch (e) {
          print("Error parsing product row: $row, Error: $e");
          // Continue with other products even if one fails to parse
        }
      }
      
      print("Successfully loaded ${products.length} products");
      return products;
      
    } on PostgrestException catch (e) {
      print("Supabase error: ${e.message}");
      throw Exception("Database error: ${e.message}");
    } catch (e) {
      print("Unexpected error loading products: $e");
      throw Exception("Failed to load products: $e");
    }
  }
  
  @override
  Future<Reviewentity> addreviews(
      {required String descriptionmessage,   
      required String name,
      required int product_id,
      required String user_id,
      required num ratingcount,
      }   
  ) async{
  await Supabase.instance.client.from("reviews").insert({
      "descriptionmessage": descriptionmessage,
      "name": name,
      "product_id": product_id,
      "user_id": user_id,
      "ratingcount": ratingcount
      
    });
return Reviewmodel.fromJson({
  "descriptionmessage": descriptionmessage,
  "name": name,
  "product_id": product_id,
  "user_id": user_id,
  "ratingcount": ratingcount

}).toEntity();
  }
  
  @override
  Future<List<Productsentities>> getBestSellingProducts() async{
    try {
      final response = await Supabase.instance.client
          .from('products')
          .select()
          .order('sellingCount', ascending: false
          
          ).limit(6);
      
      if (response.isEmpty) {
        print("No products found in database");
        return [];
      }

      List<Productsentities> products = [];
      for (var row in response) {
        try {
          products.add(Productmodel.fromJson(row).toEntity());
        } catch (e) {
          print("Error parsing product row: $row, Error: $e");
          // Continue with other products even if one fails to parse
        }
      }
      
      print("Successfully loaded ${products.length} products");
      return products;
      
    } on PostgrestException catch (e) {
      print("Supabase error: ${e.message}");
      throw Exception("Database error: ${e.message}");
    } catch (e) {
      print("Unexpected error loading products: $e");
      throw Exception("Failed to load products: $e");
    }
  }

}
import 'package:fruits_hub/features/home/data/models/favoritModel.dart';
import 'package:fruits_hub/features/home/data/models/reviewModel.dart';
import 'package:fruits_hub/features/home/data/repo/product_repo.dart';
import 'package:fruits_hub/features/home/domain/entites/favoritEntity.dart';
import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';
import 'package:fruits_hub/features/home/domain/entites/reviewEntity.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/ourProductswidget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/productmodel.dart';

class ProductRepoImpl implements ProductRepo {
  @override
  Future<List<Productsentities>> getProducts() async {
    try {
      final response = await Supabase.instance.client
          .from('products')
          .select('*, reviews(*)')
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
  Future<Reviewentity> addreviews({
    required String descriptionmessage,
    required String name,
    required int product_id,
    required String user_id,
    required num ratingcount,
  }) async {
    await Supabase.instance.client.from("reviews").insert({
      "descriptionmessage": descriptionmessage,
      "name": name,
      "product_id": product_id,
      "user_id": user_id,
      "ratingcount": ratingcount,
    });
    
    return Reviewmodel.fromJson({
      "descriptionmessage": descriptionmessage,
      "name": name,
      "product_id": product_id,
      "user_id": user_id,
      "ratingcount": ratingcount,
    }).toEntity();

  }

  @override
  Future<List<Productsentities>> getBestSellingProducts() async {
    try {
      final response = await Supabase.instance.client
          .from('products')
          .select('*, reviews(*)')
          .order('sellingCount', ascending: false)
          .limit(6);

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
Future<List<Productsentities>> getFavoriteProducts(String userId) async {
  final res = await Supabase.instance.client
      .from('favorite')
      .select('products(*)')       // we only need the joined product details
      .eq('user_id', userId)
      .eq('isfavorite', true);     // only favorites

  if (res.isEmpty) return [];

  return res.map<Productsentities>((row) {
    final productJson = row['products']; // 🔹 extract nested product object
    return Productmodel.fromJson(productJson).toEntity();
  }).toList();
}
   @override
  Future<favoritEntity> addFavorite({
    required int productId,
    required String userId,
  }) async {
    final res = await Supabase.instance.client.from('favorite').insert({
      'product_id': productId,
      'user_id': userId,
      'isfavorite': true,
    }).select().single();

    return favoritEntity(
      product_id: res['product_id'],
      user_id: res['user_id'],
      isfavorite: true,
    );
  }

  @override
  Future<void> deleteFavorite({
    required int productId,
    required String userId,
  }) async {
    await Supabase.instance.client
        .from('favorite')
        .delete()
        .eq('product_id', productId)
        .eq('user_id', userId);
  }

}

import 'package:fruits_hub/features/home/data/repo/product_repo.dart';
import 'package:fruits_hub/features/home/domain/entites/favoritEntity.dart';
import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';
class GetFavoriteProductsUsecase {
  final ProductRepo repo;
  GetFavoriteProductsUsecase(this.repo);

  Future<List<Productsentities>> call(String userId) async {
    return await repo.getFavoriteProducts(userId);
  }
}
class DeleteFavoriteUsecase {
  final ProductRepo repo;
  DeleteFavoriteUsecase(this.repo);

  Future<void> call({
    required int productId,
    required String userId,
  }) async {
    return await repo.deleteFavorite(productId: productId, userId: userId);
  }
}class AddFavoriteUsecase {
  final ProductRepo repo;
  AddFavoriteUsecase(this.repo);

  Future<favoritEntity> call({
    required int productId,
    required String userId,
  }) async {
    return await repo.addFavorite(productId: productId, userId: userId);
  }
}
// class Addfavoriteusecase {
//     final ProductRepo productRepo;
//   Addfavoriteusecase(this.productRepo);
//     Future<favoritEntity> call({

//     required int product_id,
//     required String user_id,
//     required bool isfavorite,
//   }) async {
//     return await productRepo.addfavorite(
    
//       product_id: product_id,
//       user_id: user_id,
//       isfavorite: isfavorite,
//     );
//   }
// }
// class GetFavoriteProductsUsecase {
//   final ProductRepo productRepo;
//   GetFavoriteProductsUsecase(this.productRepo);

//   Future<List<Productsentities>> call(String userId) async {
//     return await productRepo.getFavoriteProducts(userId);
//   }
// }
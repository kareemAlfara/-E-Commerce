import 'package:fruits_hub/features/home/data/repo/product_repo.dart';
import 'package:fruits_hub/features/home/domain/entites/favoritEntity.dart';
import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';

class Addfavoriteusecase {
    final ProductRepo productRepo;
  Addfavoriteusecase(this.productRepo);
    Future<favoritEntity> call({

    required int product_id,
    required String user_id,
    required bool isfavorite,
  }) async {
    return await productRepo.addfavorite(
    
      product_id: product_id,
      user_id: user_id,
      isfavorite: isfavorite,
    );
  }
}
class GetFavoriteProductsUsecase {
  final ProductRepo productRepo;
  GetFavoriteProductsUsecase(this.productRepo);

  Future<List<Productsentities>> call(String userId) async {
    return await productRepo.getFavoriteProducts(userId);
  }
}
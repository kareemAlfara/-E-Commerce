import 'package:fruits_hub/features/home/data/repo/product_repo.dart';
import 'package:fruits_hub/features/home/domain/entites/reviewEntity.dart';

class addreviewsusecase {
  final ProductRepo productRepo;
  addreviewsusecase(this.productRepo);
  
  Future<Reviewentity> call({
    required String descriptionmessage,
    required String name,
    required int product_id,
    required String user_id,
    required num ratingcount,
  }) async {
    return await productRepo.addreviews(
      descriptionmessage: descriptionmessage,
      name: name,
      product_id: product_id,
      user_id: user_id,
      ratingcount: ratingcount,
    );
  }
}

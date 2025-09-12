import 'package:fruits_hub/features/home/data/repo/product_repo.dart';
import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';

class Getbestsellingusecase {
    final ProductRepo productRepo;

  Getbestsellingusecase(this.productRepo);
  Future<List<Productsentities>> call() async {
    return await productRepo.getBestSellingProducts(); 
  }
}

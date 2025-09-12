import 'package:fruits_hub/features/home/data/models/productmodel.dart';
import 'package:fruits_hub/features/home/data/repo/product_repo.dart';
import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';
import 'package:fruits_hub/features/home/presentation/view/widget/ourProductswidget.dart';

class Getproductusecase {
  final ProductRepo productRepo;

  Getproductusecase(this.productRepo);
  Future<List<Productsentities>> call() async {
    return await productRepo.getProducts(); 
  }
}
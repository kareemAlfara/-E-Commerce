import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';
Productsentities getDummyProduct() {
  
  return Productsentities(
    name: 'Apple',
    code: '123',
    isorginic: true,
    numberofCaluries: 100,
    avgRating: 4.5,
    description: 'Fresh apple',
    price: 2.5,
    reviews: [],
   id: 11111111, image: 'https://mcprod.hyperone.com.eg/media/catalog/product/cache/8d4e6327d79fd11192282459179cc69e/2/3/2394293000006.jpg',
    unitAmount: 1,
  );
}

List<Productsentities> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}

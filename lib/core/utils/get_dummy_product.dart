import 'package:fruits_hub/features/home/domain/entites/productsEntities.dart';
Productsentities getDummyProduct() {
  
  return Productsentities(
    name: 'Apple',
    code: '123',
    description: 'Fresh apple',
    price: 2.5,
    reviews: [],
   id: 11111111, image: 'https://euudvrftyscplhfwzxli.supabase.co/storage/v1/oject/public/product_images/uploads/2af9a03e-dff1-4d8d-ad0f-1e2c7ce25519.png',
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

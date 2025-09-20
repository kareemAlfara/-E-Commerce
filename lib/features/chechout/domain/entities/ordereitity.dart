import 'package:fruits_hub/features/chechout/domain/entities/shippingAddressEntity.dart';
import 'package:fruits_hub/features/home/domain/entites/allCartEntity.dart';
import 'package:fruits_hub/features/home/domain/entites/cartEntity.dart';

class orderentity {
  final allcartEntity cartitem;
  final bool? payWithcach;
  final Shippingaddressentity? shippingAddressentity;
  orderentity({required this.cartitem,  this.payWithcach, this.shippingAddressentity});
    orderentity copyWith({
    allcartEntity? cartitem,
    bool? payWithcach,
    Shippingaddressentity? shippingAddressentity,
  }) {
    return orderentity(
      cartitem: cartitem ?? this.cartitem,
      payWithcach: payWithcach ?? this.payWithcach,
      shippingAddressentity: shippingAddressentity ?? this.shippingAddressentity,
    );
  }
}

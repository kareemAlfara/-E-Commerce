part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class addedcartsuccess extends CartState {}
final class addedcartfailure extends CartState {
  final String error;
  addedcartfailure({required this.error});
}
final class cartremovestate extends CartState {}
final class cartrdecreasestate extends CartState {}

part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class getAllproductSuccessState extends ProductState {
  final List<Productsentities> products;

  getAllproductSuccessState({required this.products});
}

final class getAllproductFailureState extends ProductState {
  final String error;

  getAllproductFailureState({required this.error});
}
final class getbestsellingSuccessState extends ProductState {
  final List<Productsentities> products;

  getbestsellingSuccessState({required this.products});
}

final class getbestsellingFailureState extends ProductState {
  final String error;

  getbestsellingFailureState({required this.error});
}

final class getProductloadingstate extends ProductState {}
final class   getbestsellingloadingstate extends ProductState {}

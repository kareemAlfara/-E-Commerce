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
final class GetFavoritesSuccessState extends ProductState {
  final List<Productsentities> favorites;
  GetFavoritesSuccessState({required this.favorites});
}

final class   GetFavoritesFailureState extends ProductState {
  final String error;

  GetFavoritesFailureState({required this.error});
}
final class   GetFavoritesLoadingState extends ProductState {}
final class   getbestsellingloadingstate extends ProductState {}

final class isfavoritechangestate extends ProductState {}
final class AddFavotitesuccess extends ProductState {}
final class AddFavotitefailur extends ProductState {
  final String error;

  AddFavotitefailur({required this.error});
}
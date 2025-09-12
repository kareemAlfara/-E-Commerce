part of 'add_review_cubit.dart';

@immutable
sealed class AddReviewState {}

final class AddReviewInitial extends AddReviewState {}
final class AddReviewsuccess extends AddReviewState {}
final class AddReviewfailur extends AddReviewState {
  final String error;

  AddReviewfailur({required this.error});
}

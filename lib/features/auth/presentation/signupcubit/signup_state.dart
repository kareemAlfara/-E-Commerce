part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class changePaswordiconstate extends SignupState {}

final class changecheckiconstate extends SignupState {}

final class SignupLoadingState extends SignupState {}

final class SignupSuccessState extends SignupState {}

final class SignupErrorState extends SignupState {
  final String error;

  SignupErrorState({required this.error});
}

part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}
final class changePaswordiconstate extends SignupState {}
final class changecheckiconstate extends SignupState {}

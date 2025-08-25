part of 'signin_cubit.dart';

@immutable
sealed class Signinstate {}

final class LoginInitial extends Signinstate {}
final class changePaswordiconstate extends Signinstate {}
final class loginuserloadingState extends Signinstate {}

final class loginusersuccessState extends Signinstate {}

final class loginuserFailerState extends Signinstate {
  final String error;

  loginuserFailerState({required this.error});
}

final class getAllUsersLoadingState extends Signinstate {}

final class getAllUsersSuccessState extends Signinstate {}

final class getAllUsersFailureState extends Signinstate {
  final String error;

  getAllUsersFailureState({required this.error});
}
final class logoutSuccessstate extends Signinstate {}

final class LogoutFailureState extends Signinstate {
  final String error;

  LogoutFailureState({required this.error});
}

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
final class changeNewpassword2iconstate extends Signinstate {}
final class changeNewpassword1iconstate extends Signinstate {}
final class SigninSuccessState extends Signinstate {}
final class SigninLoadingState extends Signinstate {} 
final class SigninErrorState extends Signinstate {
  final String error;

  SigninErrorState({required this.error});
}
final class GoogleSigninSuccessState extends Signinstate {} 
final class GoogleSigninLoadingState extends Signinstate {} 
final class GoogleSigninFailureState extends Signinstate {
  final String error;

  GoogleSigninFailureState({required this.error});
}
final class signoutState extends Signinstate {} 

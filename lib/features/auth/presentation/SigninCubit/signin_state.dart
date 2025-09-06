part of 'signin_cubit.dart';

@immutable
sealed class Signinstate {}

final class LoginInitial extends Signinstate {}
final class changePaswordiconstate extends Signinstate {}
final class logoutSuccessstate extends Signinstate {
   final UserEntity user;
  logoutSuccessstate({required this.user});
}

final class LogoutFailureState extends Signinstate {
  final String error;

  LogoutFailureState({required this.error});
}
final class changeNewpassword2iconstate extends Signinstate {}
final class changeNewpassword1iconstate extends Signinstate {}
final class SigninSuccessState extends Signinstate {
    final UserEntity user;
  
    SigninSuccessState({required this.user});
}
final class SigninLoadingState extends Signinstate {} 
final class SigninErrorState extends Signinstate {
  final String error;

  SigninErrorState({required this.error});
}
final class GoogleSigninSuccessState extends Signinstate {
   final UserEntity user;

  GoogleSigninSuccessState({required this.user});
} 
final class GoogleSigninLoadingState extends Signinstate {} 
final class GoogleSigninFailureState extends Signinstate {
  final String error;

  GoogleSigninFailureState({required this.error});
}
final class signoutState extends Signinstate {} 

final class FacebookSigninSuccessState extends Signinstate {
    final UserEntity user;
  
    FacebookSigninSuccessState({required this.user});
}
final class FacebookSigninLoadingState extends Signinstate {}
final class FacebookSigninFailureState extends Signinstate {
  final String error;

  FacebookSigninFailureState({required this.error});
}
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/usecases/Google_Signin.dart';
import 'package:fruits_hub/features/auth/domain/usecases/signin_user.dart';
import 'package:fruits_hub/features/auth/domain/usecases/signout.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'signin_state.dart';

class SigninCubit extends Cubit<Signinstate> {
  final SigninUser signinUserUseCase;
  final SigninWithGoogle signinWithGoogleUseCase;
  final Signout signoutUserUseCase;
  SigninCubit(
    this.signinUserUseCase,
    this.signinWithGoogleUseCase,
    this.signoutUserUseCase,
  ) : super(LoginInitial());
  var formkey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var passcontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  bool issecure = true;
  SigninCubit get(context) => BlocProvider.of(context);
  void changePaswordicon() {
    issecure = !issecure;
    emit(changePaswordiconstate());
  }

  bool Newpasswordissecure1 = true;
  bool Newpasswordissecure2 = true;
  void changeNewpassword1icon() {
    Newpasswordissecure1 = !Newpasswordissecure1;
    emit(changeNewpassword1iconstate());
  }

  void changeNewpassword2icon() {
    Newpasswordissecure2 = !Newpasswordissecure2;
    emit(changeNewpassword2iconstate());
  }

  Future<void> userSigninWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (formkey.currentState!.validate()) {
      emit(SigninLoadingState());
      try {
        final UserEntity user = await signinUserUseCase(email, password);
        emit(SigninSuccessState());
      } catch (e) {
        emit(SigninErrorState(error: e.toString()));
      }
    }
  }

  Future<void> signInWithGoogle() async  {
    emit(GoogleSigninLoadingState());

    try {
      final UserEntity user = await signinWithGoogleUseCase();
      emit(GoogleSigninSuccessState());
    } catch (error) {
      debugPrint('Google Sign-In Error: $error');
      emit(
        GoogleSigninFailureState(
          error: 'Google Sign-In failed: ${error.toString()}',
        ),
      );

      // Try to sign out in case of partial sign-in
      try {
        await AuthRepoImpl().signout();
      } catch (signOutError) {
        debugPrint('Sign-out error: $signOutError');
      }

      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await signoutUserUseCase();
    } catch (e) {
      debugPrint('Sign-out error: $e');
    }
  }

  @override
  Future<void> close() {
    phoneController.dispose();
    passcontroller.dispose();
    emailcontroller.dispose();
    return super.close();
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/usecases/Google_Signin.dart';
import 'package:fruits_hub/features/auth/domain/usecases/facebookSignin.dart';
import 'package:fruits_hub/features/auth/domain/usecases/signin_user.dart';
import 'package:fruits_hub/features/auth/domain/usecases/signout.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'signin_state.dart';

class SigninCubit extends Cubit<Signinstate> {
  final SigninUser signinUserUseCase;
  final SigninWithGoogle signinWithGoogleUseCase;
  final Signout signoutUserUseCase;
  final FacebookSignin facebookSigninUseCase;
  SigninCubit(
    this.signinUserUseCase,
    this.signinWithGoogleUseCase,
    this.signoutUserUseCase,
    this.facebookSigninUseCase,
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
        emit(SigninSuccessState(user: user));
      } catch (e) {
        emit(SigninErrorState(error: e.toString()));
      }
    }
  }

  Future<void> signInWithGoogle() async {
    emit(GoogleSigninLoadingState());

    try {
      final UserEntity user = await signinWithGoogleUseCase();
      emit(GoogleSigninSuccessState(user: user));
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

  Future<void> signInWithFacebook() async {
    emit(FacebookSigninLoadingState());

    try {
      final UserEntity user = await facebookSigninUseCase();
      emit(FacebookSigninSuccessState(user: user));
    } catch (error) {
      debugPrint('Facebook Sign-In Error: $error');
      emit(
        FacebookSigninFailureState(
          error: 'Facebook Sign-In failed: ${error.toString()}',
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

  // final List<Usersmodel> _allUsers = [];
  // List<Usersmodel> get allUsers => _allUsers;
  // Future<void> fetchAllUsers() async {
  //   final response = await Supabase.instance.client.from('users').select();

  //   _allUsers.clear();
  //   for (var row in response) {
  //     _allUsers.add(
  //       Usersmodel.fromJson(row)
  //     );
  //   }
  // }
  Future<String> getusername()async {
    final prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username')!;
    return username;
  }
  @override
  Future<void> close() {
    phoneController.dispose();
    passcontroller.dispose();
    emailcontroller.dispose();
    return super.close();
  }
}

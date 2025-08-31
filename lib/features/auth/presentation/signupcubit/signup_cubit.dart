import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/auth/data/repos/auth_repo_impl.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/usecases/signup_user.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupUser signupUser;
  SignupCubit(this.signupUser) : super(SignupInitial());
  var formkey = GlobalKey<FormState>();
  var passcontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  bool issecure = true;
  bool ischecked = false;
  SignupCubit get(context) => BlocProvider.of(context);
  void changePaswordicon() {
    issecure = !issecure;
    emit(changePaswordiconstate());
  }
  void changecheckicon() {
    ischecked = !ischecked;
    emit(changecheckiconstate());
  }
  userSignupWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    if (formkey.currentState!.validate()) {
      emit(SignupLoadingState());
      try {
final UserEntity userEntity=await signupUser( email,  password, name)  ;
        emit(SignupSuccessState());
      } catch (e) {
        emit(SignupErrorState( error: e.toString(),));
      }
    }
  }
}



import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
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
}



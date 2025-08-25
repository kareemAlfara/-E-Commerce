import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'signin_state.dart';

class SigninCubit extends Cubit<Signinstate> {
  SigninCubit() : super(LoginInitial());
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

}

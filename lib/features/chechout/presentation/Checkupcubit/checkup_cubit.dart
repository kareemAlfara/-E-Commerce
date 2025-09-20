import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/chechout/domain/entities/ordereitity.dart';
import 'package:fruits_hub/features/chechout/presentation/view/shippingView.dart';
import 'package:fruits_hub/features/chechout/presentation/view/widget/addressWidget.dart';
import 'package:fruits_hub/features/chechout/presentation/view/widget/paymentReview.dart';
import 'package:fruits_hub/features/chechout/presentation/view/widget/paymentWidget.dart';
import 'package:fruits_hub/features/home/domain/entites/allCartEntity.dart';

part 'checkup_state.dart';

class CheckupCubit extends Cubit<CheckupState> {
  CheckupCubit() : super(CheckupInitial());
  var formkey = GlobalKey<FormState>();
  static CheckupCubit get(context) => BlocProvider.of(context);
  // int index = 0;
  void changeIndex(int value) {
    emit(state.copyWith(index: value));
  }

  void decreaseIndex(BuildContext context) {
    if (state.index == 0) {
      Navigator.pop(context);
    } else {
      emit(state.copyWith(index: state.index - 1));
    }
  }

  // int ispaychecked = -1;
  void changepayment(int index) {
    emit(state.copyWith(paymentIndex: index));
      if (order != null) {
    order = order!.copyWith(
      payWithcach: index == 0, // الدفع عند الاستلام = true, otherwise false
    );
  }
  }

  bool issaveaddreess = false;
  void changesaveAddress(value) {
    emit(state.copyWith(issaveaddreess: value));
  }

  // ///////////////////
  orderentity? order; // keep the selected order in cubit

void getcartitem(allcartEntity cartitem) {
  order = orderentity(cartitem: cartitem);
}


  // allcartEntity? cartitem;

  // void setCartItem(allcartEntity item) {
  //   cartitem = item;
  // }

  // orderentity getOrder() {
  //   return orderentity(cartitem: cartitem!);
  // }
  // /////////////////
  void isdefultcard(value) {
    emit(state.copyWith(isDefultCard: value));
  }

  var emailcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var addresscontroller = TextEditingController();
  var citycontroller = TextEditingController();
  var homecontroller = TextEditingController();
  var paymentnamecontroller = TextEditingController();
  var paymentcardNumcontroller = TextEditingController();
  var paymentDatecontroller = TextEditingController();
  var paymentCVVcontroller = TextEditingController();
  List<String> appbartitle = ["الشحن", "العنوان", "الدفع", "المراجعة "];
  List<Widget> checkupbody = [
    shippingView(),
    Addresswidget(),
    Paymentwidget(),
    PaymentReview(),
  ];

  PreferredSizeWidget? defaultChechupAppBar({
    required BuildContext context,
    required String title,
    bool automaticallyImplyLeading = true,
    bool isShowActions = true,
  }) => AppBar(
    centerTitle: true,

    automaticallyImplyLeading: automaticallyImplyLeading,
    leading: automaticallyImplyLeading
        ? IconButton(
            onPressed: () {
              decreaseIndex(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          )
        : SizedBox.shrink(),
    title: Text(
      "$title",
      style: const TextStyle(
        fontFamily: 'Cairo',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

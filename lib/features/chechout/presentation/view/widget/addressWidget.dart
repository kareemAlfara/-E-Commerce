import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:fruits_hub/features/chechout/domain/entities/shippingAddressEntity.dart';
import 'package:fruits_hub/features/chechout/presentation/Checkupcubit/checkup_cubit.dart';

class Addresswidget extends StatefulWidget {
  const Addresswidget({super.key});

  @override
  State<Addresswidget> createState() => _AddresswidgetState();
}

class _AddresswidgetState extends State<Addresswidget> {
  bool issaveaddreess = false;
  void changeissaveaddreess(value) {
    issaveaddreess = value;

    // emit(changepaymentState(0, -1));
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CheckupCubit>();

    return BlocBuilder<CheckupCubit, CheckupState>(
      builder: (context, state) {
        return Form(
          key: cubit.formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: defulitTextFormField(
                    controller: cubit.namecontroller,
                    hintText: ' الإســـم كامل',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "أدخل  الاسم";
                      }
                      return null;
                    },
                    isobscure: false,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: defulitTextFormField(
                    controller: cubit.emailcontroller,
                    hintText: 'البريد الإلكتروني',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "أدخل البريد الإلكتروني";
                      }
                      return null;
                    },
                    isobscure: false,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: defulitTextFormField(
                    controller: cubit.phonecontroller,
                    keyboardType: TextInputType.number,
                    hintText: ' رقم الهاتف',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "أدخل رقم الهاتف ";
                      }
                      return null;
                    },
                    isobscure: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: defulitTextFormField(
                    controller: cubit.addresscontroller,
                    hintText: ' العنوان',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "أدخل  العنوان";
                      }
                      return null;
                    },
                    isobscure: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: defulitTextFormField(
                    controller: cubit.citycontroller,
                    hintText: ' المدينة',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "أدخل  المدينة";
                      }
                      return null;
                    },
                    isobscure: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: defulitTextFormField(
                    controller: cubit.homecontroller,
                    hintText: ' رقم الطابق - الشقة ',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "أدخل رقم الطابق ";
                      }
                      return null;
                    },
                  textInputAction: TextInputAction.done  ,
                    isobscure: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Switch(
                        value: state.issaveaddreess,
                        onChanged: (value) {
                          cubit.changesaveAddress(value);
                        },
                      ),
                      SizedBox(width: 11),
                      defulttext(
                        data: "حفظ العنوان",
                        color: Colors.grey,
                        fw: FontWeight.w600,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 55),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    text: "التالي",
                    onPressed: () {
                      if (cubit.formkey.currentState!.validate()) {
                        cubit.order = cubit.order!.copyWith(
                          shippingAddressentity: Shippingaddressentity(
                            address: cubit.addresscontroller.text,
                            phone: cubit.phonecontroller.text,
                            name: cubit.namecontroller.text,
                            email: cubit.emailcontroller.text,
                            city: cubit.citycontroller.text,
                            subaddress: cubit.homecontroller.text,
                            // other fields...
                          ),
                        );
                        cubit.changeIndex(state.index + 1);
                        log(state.index.toString());
                      }
                    },
                    fSize: 18,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

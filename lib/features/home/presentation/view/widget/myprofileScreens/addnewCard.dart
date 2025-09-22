import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';

class Addnewcard extends StatelessWidget {
  const Addnewcard({super.key});
static const routeName = 'addnewcard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        title: "اضافة بطاقة جديده",
        isShowActions: false,
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(children: [
            SizedBox(height: 22),
                  defulitTextFormField(
                    // controller: cubit.paymentnamecontroller,
                    hintText: ' أسم حامل البطاقة',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "أدخل   أسم حامل البطاقة";
                      }
                      return null;
                    },
                    isobscure: false,
                  ),
                  SizedBox(height: 11),
                  defulitTextFormField(
                    // controller: cubit.paymentcardNumcontroller,
                    hintText: ' رقم البطاقة ',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "أدخل  رقم البطاقة";
                      }
                      return null;
                    },
                    isobscure: false,
                  ),
                  SizedBox(height: 11),
        
                  Container(
                    height: 70,
                    // width: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: defulitTextFormField(
                            // controller: cubit.paymentDatecontroller,
                            hintText: ' تاريخ الصلاحية ',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "أدخل  تاريخ الصلاحية";
                              }
                              return null;
                            },
                            isobscure: false,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: defulitTextFormField(
                            // controller: cubit.paymentCVVcontroller,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please inter the  number of CVV";
                              }
                              return null;
                            },
        
                            hintText: "CVV",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 11),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.3, // 🔥 make it 1.5x bigger
                        child: Checkbox(
                          value: true,
                          onChanged: (value) {
                            // cubit.isdefultcard(value);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      defulttext(data: "جعل البطاقة افتراضية"),
                    ],
                  ),
                  SizedBox(height: 22),
                  CustomButton(
                    onPressed: () {
                      // cubit.changeIndex(state.index + 1);
                      // log(state.index.toString());
                    },
                    text: "تاكيد & استمرار",
                    fSize: 16,
                  ),
        ]),
      ),
    );
  }
}

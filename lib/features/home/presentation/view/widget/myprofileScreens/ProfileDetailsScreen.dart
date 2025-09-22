
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:svg_flutter/svg.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});
  static const String routeName = 'profileDetails';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

final String username = args?["name"] ?? "اسم غير متوفر";
final String email = args?["email"] ?? "بريد غير متوفر";

    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "الملف الشخصية",
        isShowActions: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              defulttext(
                data: "المعلومات الشخصي",
                fSize: 16,
                fw: FontWeight.w700,
              ),
              SizedBox(height: 20),
              defulitTextFormField(
                hintText: username,
                suffixIcon: Container(
                  width: 12,
                  height: 12,
                  padding: EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    Assets.imagesEdit,
                    color: Colors.grey[400],
                  ),
                ),
              ),
              SizedBox(height: 10),
        
              defulitTextFormField(
                hintText: email,
                suffixIcon: Container(
                  width: 12,
                  height: 12,
                  padding: EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    Assets.imagesEdit,
                    color: Colors.grey[400],
                  ),
                ),
              ),
                SizedBox(height: 10),
          defulttext(
                data: "المعلومات الشخصي",
                fSize: 14,
                fw: FontWeight.w400,
              ),
              SizedBox(height: 10),
              defulitTextFormField(
                        // controller: cubit.passcontroller,
                        hintText: "كلمة المرور الحالية",
                        // isobscure: cubit.issecure,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "أدخل كلمة المرور";
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          onPressed: () {
                            // cubit.changePaswordicon();
                          },
            
                          icon: true
                              ? Icon(Icons.visibility, color: Colors.grey)
                              : Icon(Icons.visibility_off, color: Colors.grey),
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                        SizedBox(height: 10),
              defulitTextFormField(
                        // controller: cubit.passcontroller,
                        hintText: "كلمة المرور الجديدة",
                        // isobscure: cubit.issecure,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "  أدخل كلمة المرور";
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          onPressed: () {
                            // cubit.changePaswordicon();
                          },
            
                          icon: true
                              ? Icon(Icons.visibility, color: Colors.grey)
                              : Icon(Icons.visibility_off, color: Colors.grey),
                        ),
                        textInputAction: TextInputAction.done,
                      ),  SizedBox(height: 10),
              defulitTextFormField(
                        // controller: cubit.passcontroller,
                        hintText: ' تاكيد كلمة المرور ',
                        // isobscure: cubit.issecure,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "أدخل كلمة المرور";
                          }
                          return null;
                        },
                        suffixIcon: IconButton(
                          onPressed: () {
                            // cubit.changePaswordicon();
                          },
            
                          icon: true
                              ? Icon(Icons.visibility, color: Colors.grey)
                              : Icon(Icons.visibility_off, color: Colors.grey),
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                    SizedBox(height: 20),
                    CustomButton(onPressed: () {
                      
                    }, text: "حفظ التغييرات"),
            ],
          ),
        ),
      ),
    );
  }
}


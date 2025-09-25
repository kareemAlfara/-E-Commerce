
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/core/widget/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:svg_flutter/svg.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});
  static const String routeName = 'profileDetails';

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  String? userId;
  String? username;
  String? email;
    void initState() {
    super.initState();
    loadUserData();
  }
Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getString('user_id');
      username = prefs.getString('username');
      email = prefs.getString('email');
    });
  }
  @override
  Widget build(BuildContext context) {
    
  
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: "الملف الشخصي",
        isShowActions: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              defulttext(
                          context: context,

                data: "المعلومات الشخصية",
                fSize: 16,
                fw: FontWeight.w700,
              ),
              SizedBox(height: 20),
              defulitTextFormField(
                    context: context,

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
                    context: context,

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
                          context: context,

                data: "المعلومات الشخصي",
                fSize: 14,
                fw: FontWeight.w400,
              ),
              SizedBox(height: 10),
              defulitTextFormField(
                    context: context,

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
                    context: context,

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
                    context: context,

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


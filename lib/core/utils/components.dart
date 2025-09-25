import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:svg_flutter/svg.dart';

PreferredSizeWidget? defaultAppBar({
  required BuildContext context,
  required String title,
  bool automaticallyImplyLeading = true,
  bool isShowActions = true,
}) => AppBar(
  backgroundColor: Theme.of(context).brightness == Brightness.dark
      ? Colors.black12
      : Colors.white,
  centerTitle: true,
  automaticallyImplyLeading: automaticallyImplyLeading,
  leading: automaticallyImplyLeading
      ? IconButton(
          onPressed: () {
            Navigator.pop(context);
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
  actions: [
    isShowActions
        ? GestureDetector(
            onTap: () async {
              // Handle notification tap
            },
            child: SvgPicture.asset(
              Assets.imagesNotification,
              fit: BoxFit.fill,
              height: 30,
              width: 30,
            ),
          )
        : SizedBox.shrink(),
    SizedBox(width: 8),
  ],
);

String? uid;
const kUserData = 'userData';
Future<dynamic> navigat(context, {required Widget widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

Widget defulttext({
  TextDirection? textDirection,
  required BuildContext context,
  TextAlign? textAlign,
  required String data,
  double? fSize,
  Color? color,
  FontWeight? fw,
  int? maxLines = 4,
}) => Text(
  textAlign: textAlign,
  textDirection: textDirection,
  maxLines: maxLines,
  data,
  style: TextStyle(
    fontFamily: 'Cairo',
    fontSize: fSize,
    color:
        color ??
        (Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black),

    fontWeight: fw,
  ).copyWith(overflow: TextOverflow.ellipsis),
);
Widget defulitTextFormField({
  int? maxline = 1,
  String? title,
  String? hintText,
  Widget? suffixIcon,
  Widget? label,
  bool? isdarkmode,
  TextInputType? keyboardType = TextInputType.multiline,
  Color? textcolor,
  // Color? bordercolor=Colors.white,
  Color? bordercolor,
  void Function(String)? onChanged,
  TextInputAction? textInputAction,
  TextEditingController? controller,
  String? Function(String?)? validator,
  void Function(String)? onFieldSubmitted,
  bool isobscure = false,
  bool filled = false, // Important: enables fillColor
  Color? fillColor, // Inside color
  Widget? prefix,
  required BuildContext context,
}) => TextFormField(
  keyboardType: keyboardType,
  obscureText: isobscure,
  onFieldSubmitted: onFieldSubmitted,
  maxLines: maxline,
  onChanged: onChanged,
  validator: validator,
  textInputAction: textInputAction,
  controller: controller,
  style: TextStyle(
    color:
        textcolor ??
        (Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black),
  ),

  decoration: InputDecoration(
    prefix: prefix,
    hintStyle: TextStyle(color: Colors.grey),
    filled: filled, // Important: enables fillColor
    fillColor: fillColor, // Inside color
    hintText: hintText,
    suffixIcon: suffixIcon,
    label: label,
    labelText: title,
    labelStyle: TextStyle(color: textcolor),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: bordercolor??(Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black),),
    ),
    // focusColor: Colors.white,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),

      borderSide: BorderSide(color:bordercolor??(Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black),),
    ),
  ),
);

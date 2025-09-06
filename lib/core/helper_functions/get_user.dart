import 'dart:convert';


import 'package:fruits_hub/core/services/Shared_preferences.dart';
import 'package:fruits_hub/core/utils/components.dart';
import 'package:fruits_hub/features/auth/data/models/usersModel.dart';
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = Usersmodel.fromJson(jsonDecode(jsonString));
  return userEntity;
}

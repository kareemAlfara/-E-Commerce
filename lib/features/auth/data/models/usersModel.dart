import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';

class Usersmodel extends UserEntity {
  // final String id;
  // final String email;
  // final String name;
  // final String password;

  Usersmodel({
    required super.id,
    required super.email,
    required super.password,
    required super.name,
  });

  factory Usersmodel.fromJson(Map<String, dynamic> json) {
    return Usersmodel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
    };
  }
}

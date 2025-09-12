import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';

class Usersmodel {
  final String id;
  final String email;
  final String name;
  final String password;

  Usersmodel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
  });

  factory Usersmodel.fromJson(Map<String, dynamic> json) {
    return Usersmodel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
    );
  }
  UserEntity toEntity() =>
      UserEntity(id: id, email: email, password: password, name: name);
  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'password': password, 'name': name};
  }
}

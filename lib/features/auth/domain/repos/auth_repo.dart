import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signup(String email, String password, String name);
  Future<UserEntity> signin(String email, String password);
  Future<UserEntity> signinWithGoogle();
  Future<UserEntity> signinWithFacebook();
  Future<void> signout();
}

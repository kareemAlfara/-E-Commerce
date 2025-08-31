import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class SigninUser {
  final AuthRepository repository;

  SigninUser(this.repository);
  Future<UserEntity> call(String email, String password) async {
    return await repository.signin(email, password);
  }
}

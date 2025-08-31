import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class SignupUser {
  final AuthRepository authRepository;
  SignupUser(this.authRepository);
  Future <UserEntity> call(String email, String password, String name) async {
    return await authRepository.signup(email, password, name);
  }
}

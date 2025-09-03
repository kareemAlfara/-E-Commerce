import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class FacebookSignin {
  final AuthRepository authRepository;

  FacebookSignin(this.authRepository);

  Future<UserEntity> call() {
    return authRepository.signinWithFacebook();
  }
}

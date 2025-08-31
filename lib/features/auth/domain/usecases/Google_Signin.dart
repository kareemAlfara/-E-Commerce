import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

// usecases/signin_with_google.dart
import 'package:fruits_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class SigninWithGoogle {
  final AuthRepository repository;
  SigninWithGoogle(this.repository);

  Future<UserEntity> call() async {
    return await repository.signinWithGoogle();
  }
}
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class Signout {
  final AuthRepository repository;

  Signout(this.repository);

  Future<void> call() async {
    return await repository.signout();
  } 
}
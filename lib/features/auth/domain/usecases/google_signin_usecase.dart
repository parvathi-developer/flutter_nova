import 'package:flutter_nova/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_nova/features/auth/domain/repositories/auth_repository.dart';

class GoogleSignInUsecase {
  AuthRepository authRepository;

  GoogleSignInUsecase(this.authRepository);

  Future<UserEntity> call() {
    return authRepository.signInWithGoogle();
  }
}

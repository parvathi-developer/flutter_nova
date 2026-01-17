import 'package:flutter_nova/features/auth/domain/repositories/auth_repository.dart';

class AnonymousLoginUsecase {
  final AuthRepository authRepository;
  AnonymousLoginUsecase(this.authRepository);

  Future<void> call() {
    return authRepository.signInAnonymously();
  }
}

import 'package:flutter_nova/features/auth/domain/repositories/auth_repository.dart';

class ForgotPasswordUsecase {
  final AuthRepository authRepository;

  ForgotPasswordUsecase(this.authRepository);

  Future<void> call(String email) {
    return authRepository.sendPasswordReset(email);
  }
}

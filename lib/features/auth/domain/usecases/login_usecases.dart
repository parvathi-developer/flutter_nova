import 'package:flutter_nova/core/usecases/usecase.dart';
import 'package:flutter_nova/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_nova/features/auth/domain/repositories/auth_repository.dart';

class LoginUsecase implements UseCase<UserEntity, LoginParams> {
  final AuthRepository repository;
  LoginUsecase(this.repository);

  @override
  Future<UserEntity> call(LoginParams params) {
    return repository.login(email: params.email, password: params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});
}

import 'package:flutter_nova/core/usecases/usecase.dart';
import 'package:flutter_nova/features/auth/domain/repositories/auth_repository.dart';

class LogoutUsecase implements UseCase<void, NoParams> {
  final AuthRepository repository;
  LogoutUsecase(this.repository);

  @override
  Future<void> call(NoParams params) {
    return repository.logout();
  }
}

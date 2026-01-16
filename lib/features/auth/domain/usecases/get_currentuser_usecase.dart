import 'package:flutter_nova/core/usecases/usecase.dart';
import 'package:flutter_nova/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_nova/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentuserUsecase implements UseCase<UserEntity?, NoParams> {
  final AuthRepository repository;

  GetCurrentuserUsecase(this.repository);

  @override
  Future<UserEntity?> call(NoParams params) {
    return repository.getCurrentUser();
  }
}

import 'package:flutter_nova/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:flutter_nova/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_nova/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasources remoteDatasource;
  AuthRepositoryImpl(this.remoteDatasource);
  @override
  Future<UserEntity?> getCurrentUser() {
    return remoteDatasource.getCurrentUser();
  }

  @override
  Future<UserEntity> login({required String email, required String password}) {
    return remoteDatasource.login(email: email, password: password);
  }

  @override
  Future<void> logout() {
    return remoteDatasource.logout();
  }
}

import 'package:flutter_nova/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login({required String email, required String password});
  Future<void> logout();
  Future<UserEntity?> getCurrentUser();
  Future<void> sendPasswordReset(String email);
  Future<UserEntity> signInWithGoogle();
  Future<UserEntity> signInAnonymously();
  Future<UserEntity> register({
    required String email,
    required String password,
  });
}

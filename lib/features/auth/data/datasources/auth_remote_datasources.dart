import 'package:flutter_nova/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDatasources {
  Future<UserModel> login({required String email, required String password});
  Future<void> logout();
  Future<UserModel?> getCurrentUser();
}

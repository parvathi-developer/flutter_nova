import 'package:flutter_nova/features/auth/domain/entities/user_entity.dart';

abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {}

class AuthAuthenticated extends AuthStates {
  final UserEntity userEntity;
  AuthAuthenticated(this.userEntity);
}

class AuthUnAuthenticated extends AuthStates {}

class AuthError extends AuthStates {
  final String errorMessage;

  AuthError(this.errorMessage);
}

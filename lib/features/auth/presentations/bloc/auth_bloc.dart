import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nova/core/usecases/usecase.dart';
import 'package:flutter_nova/features/auth/domain/usecases/get_currentuser_usecase.dart';
import 'package:flutter_nova/features/auth/domain/usecases/login_usecases.dart';
import 'package:flutter_nova/features/auth/domain/usecases/logout_usecase.dart';
import 'package:flutter_nova/features/auth/presentations/bloc/auth_event.dart';
import 'package:flutter_nova/features/auth/presentations/bloc/auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthStates> {
  final LoginUsecase loginUsecase;
  final LogoutUsecase logoutUsecase;
  final GetCurrentuserUsecase getCurrentuserUsecase;

  AuthBloc({
    required this.loginUsecase,
    required this.logoutUsecase,
    required this.getCurrentuserUsecase,
  }) : super(AuthInitial()) {
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthCheckRequested>(_onAuthCheckedRequested);
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthStates> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = await loginUsecase(
        LoginParams(email: event.email, password: event.password),
      );
      emit(AuthAuthenticated(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthStates> emit,
  ) async {
    emit(AuthLoading());
    await logoutUsecase(const NoParams());
    emit(AuthUnAuthenticated());
  }

  Future<void> _onAuthCheckedRequested(
    AuthCheckRequested event,
    Emitter<AuthStates> emit,
  ) async {
    final user = await getCurrentuserUsecase(NoParams());
    if (user != null) {
      emit(AuthAuthenticated(user));
    } else {
      emit(AuthUnAuthenticated());
    }
  }
}

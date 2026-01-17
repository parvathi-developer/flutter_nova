import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nova/core/di/service_locator.dart';
import 'package:flutter_nova/core/routes/router_refrese_stream.dart';
import 'package:flutter_nova/features/auth/presentations/bloc/auth_bloc.dart';
import 'package:flutter_nova/features/auth/presentations/bloc/auth_states.dart';
import 'package:flutter_nova/features/auth/presentations/pages/forgot_password_page.dart';
import 'package:flutter_nova/features/auth/presentations/pages/login_page.dart';
import 'package:flutter_nova/features/auth/presentations/pages/register_page.dart';
import 'package:flutter_nova/features/auth/presentations/pages/splash_page.dart';
import 'package:flutter_nova/features/home/presentation/pages/nova_home.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: "/",
  refreshListenable: RouterRefreseStream(s1<AuthBloc>().stream),
  redirect: (context, state) {
    final authstate = context.read<AuthBloc>().state;
    if (authstate is AuthInitial || authstate is AuthLoading) {
      return '/splash';
    }
    if (authstate is AuthAuthenticated) {
      return '/home';
    }

    if (authstate is AuthUnAuthenticated || authstate is AuthError) {
      return '/login';
    }

    return '/splash';
  },
  routes: [
    GoRoute(path: "/", builder: (_, _) => LoginPage()),
    GoRoute(path: "/login", builder: (_, _) => LoginPage()),
    GoRoute(path: "/register", builder: (_, _) => RegisterPage()),
    GoRoute(path: '/forgot', builder: (_, __) => ForgotPasswordPage()),
    GoRoute(path: '/home', builder: (_, __) => const NovaHome()),
    GoRoute(path: "/splash", builder: (_, _) => SplashPage()),
  ],
);

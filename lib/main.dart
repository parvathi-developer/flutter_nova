import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nova/core/bloc/theme_bloc.dart';
import 'package:flutter_nova/core/bloc/theme_state.dart';
import 'package:flutter_nova/core/di/service_locator.dart';
import 'package:flutter_nova/core/routes/app_router.dart';
import 'package:flutter_nova/core/theme/app_theme.dart';
import 'package:flutter_nova/features/auth/presentations/bloc/auth_bloc.dart';
import 'package:flutter_nova/features/auth/presentations/bloc/auth_states.dart';
import 'package:flutter_nova/features/auth/presentations/pages/login_page.dart';
import 'package:flutter_nova/features/auth/presentations/pages/splash_page.dart';
import 'package:flutter_nova/features/home/presentation/pages/nova_home.dart';
import 'package:flutter_nova/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initCoreDepenencies();
  runApp(const FlutterNovaApp());
}

class FlutterNovaApp extends StatelessWidget {
  const FlutterNovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (_) => s1<ThemeBloc>()),
        BlocProvider<AuthBloc>(create: (_) => s1<AuthBloc>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, states) {
          return BlocBuilder<AuthBloc, AuthStates>(
            builder: (context, state) {
              return MaterialApp.router(
                routerConfig: router,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: states.themeMode,
              );
            },
          );
        },
      ),
    );
  }
}

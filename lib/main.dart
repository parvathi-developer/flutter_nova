import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nova/core/bloc/theme_bloc.dart';
import 'package:flutter_nova/core/bloc/theme_state.dart';
import 'package:flutter_nova/core/di/service_locator.dart';
import 'package:flutter_nova/core/theme/app_theme.dart';
import 'package:flutter_nova/features/home/presentation/pages/nova_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initCoreDepenencies();
  runApp(const FlutterNovaApp());
}

class FlutterNovaApp extends StatelessWidget {
  const FlutterNovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.themeMode,

            home: NovaHome(),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_nova/core/bloc/theme_event.dart';
import 'package:flutter_nova/core/bloc/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(ThemeMode.system)) {
    on<ToggleThemeEvent>((_, emit) {
      debugPrint('Theme toggled from ${state.themeMode}');

      final nextTheme = state.themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;

      emit(ThemeState(nextTheme));
    });

    on<SetSystemThemeEvent>((_, emit) {
      emit(const ThemeState(ThemeMode.system));
    });
  }
}

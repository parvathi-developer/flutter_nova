import 'package:flutter/material.dart';
import 'package:flutter_nova/core/theme/app_colors.dart';
import 'package:flutter_nova/core/theme/app_text_style.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.novaPrimary,
      secondary: AppColors.novaSecondary,
      surface: AppColors.darkSurface,
    ),
    textTheme: AppTextStyle.darkTextTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      elevation: 0,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: const ColorScheme.light(
      primary: AppColors.novaPrimary,
      secondary: AppColors.novaSecondary,
      surface: AppColors.lightSurface,
    ),
    textTheme: AppTextStyle.lightTextTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      elevation: 0,
    ),
  );
}

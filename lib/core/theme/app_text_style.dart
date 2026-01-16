import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nova/core/theme/app_colors.dart';
import 'package:flutter_nova/core/utils/screen_utils.dart';

class AppTextStyle {
  static TextTheme darkTextTheme = const TextTheme(
    headlineMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColors.darkTextPrimary,
    ),
    bodyMedium: TextStyle(fontSize: 16, color: AppColors.darkTextSecondary),
    bodySmall: TextStyle(fontSize: 13, color: AppColors.darkTextSecondary),
  );

  static TextTheme lightTextTheme = const TextTheme(
    headlineMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColors.lightTextPrimary,
    ),
    bodyMedium: TextStyle(fontSize: 16, color: AppColors.lightTextSecondary),
    bodySmall: TextStyle(fontSize: 13, color: AppColors.lightTextSecondary),
  );
}

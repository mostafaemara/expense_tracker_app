import 'package:expense_tracker_app/src/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static get lightTheme {
    return ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)))))),
        fontFamily: "Inter",
        colorScheme: const ColorScheme(
            primary: AppColors.violet,
            primaryVariant: AppColors.violet,
            secondary: AppColors.violet20,
            secondaryVariant: AppColors.violet,
            surface: AppColors.light,
            background: AppColors.light,
            error: AppColors.light,
            onPrimary: AppColors.light,
            onSecondary: AppColors.violet,
            onSurface: AppColors.dark,
            onBackground: AppColors.dark,
            onError: AppColors.dark,
            brightness: Brightness.light));
  }
}

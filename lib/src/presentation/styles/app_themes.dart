import 'package:expense_tracker_app/src/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static get lightTheme {
    return ThemeData(
        textTheme: const TextTheme(
          headline4:
              TextStyle(fontWeight: FontWeight.w600, color: AppColors.dark),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: AppColors.violet,
            foregroundColor: AppColors.light),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: AppColors.violet,
            unselectedItemColor: AppColors.unselectedItemColor),
        scaffoldBackgroundColor: AppColors.light80,
        unselectedWidgetColor: AppColors.violet,
        inputDecorationTheme: InputDecorationTheme(
            fillColor: AppColors.light,
            hintStyle: const TextStyle(
              color: AppColors.light20,
              fontFamily: "Inter",
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: AppColors.light40)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: AppColors.borderColor))),
        appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: AppColors.dark),
            backgroundColor: Colors.transparent,
            titleTextStyle: TextStyle(
                color: AppColors.dark,
                fontSize: 20,
                fontFamily: "Inter",
                fontWeight: FontWeight.bold)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0),
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

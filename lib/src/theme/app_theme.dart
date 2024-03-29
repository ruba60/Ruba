import 'package:flutter/material.dart';
import 'package:hospital_mang2/src/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData lighTheme() => ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(backgroundColor: AppColors.lightBlue),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(AppColors.lightBlue),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          )),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.lightBlue)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.lightBlue)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.red)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.lightBlue))));
}

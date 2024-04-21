import 'package:flutter/material.dart';
import 'package:hospital_mang2/src/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData lighTheme() => ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.secondary,
          iconTheme: IconThemeData(color: AppColors.white),
          titleTextStyle: TextStyle(color: AppColors.white, fontSize: 22)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(AppColors.secondary),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          )),
        ),
      ),
      listTileTheme: ListTileThemeData(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      )),
      inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.secondary)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.secondary)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.red)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: AppColors.secondary))));
}

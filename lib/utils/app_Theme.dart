import 'package:flutter/material.dart';
import 'package:islamy/utils/App_Colors.dart';
import 'package:islamy/utils/App_Style.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.WhiteColor,
            unselectedItemColor: AppColors.blackColor,
    )
  , textTheme: TextTheme(
    headlineLarge:   AppStyle.bold16White,

  )
  );
}

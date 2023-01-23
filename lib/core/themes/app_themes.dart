import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_dimension.dart';

class _ThemeName {
  _ThemeName._();

//static String poppins = "Poppins";
}

class AppTheme {
  static ThemeData themeDataLight = new ThemeData(

      //fontFamily: _ThemeName.poppins,
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      errorColor: AppColors.errorColor,
      buttonTheme: ButtonThemeData(),
      shadowColor: AppColors.shadowColor,
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: AppDimension.h1,
            fontWeight: FontWeight.bold,
            color: AppColors.textColorOne),
        headline2: TextStyle(
            fontSize: AppDimension.h2,
            fontWeight: FontWeight.bold,
            color: AppColors.textColorOne),
        bodyText1: TextStyle(
            fontSize: AppDimension.b2,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.9,
            wordSpacing: 6,
            color: AppColors.textColorOne),
        bodyText2: TextStyle(
            fontSize: AppDimension.b3,
            fontWeight: FontWeight.normal,
            color: AppColors.textColorOne),
      ),
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: AppColors.primaryColor));

  static ThemeData themeDataDark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.red,
    scaffoldBackgroundColor: Colors.grey[850],
  );
}

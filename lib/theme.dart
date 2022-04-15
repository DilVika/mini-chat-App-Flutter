import 'package:flutter/material.dart';
import 'package:mini_chat_app_flutter/resources/colors.dart';

class AppTheme {
  static final ThemeData defaultTheme = ThemeData(
    colorScheme: const ColorScheme(
      primary: AppColors.darkBlue,
      background: AppColors.white,
      brightness: Brightness.light,
      error: Colors.redAccent,
      onBackground: AppColors.black,
      onError: AppColors.darkBlue,
      onPrimary: AppColors.white,
      onSecondary: AppColors.darkBlue,
      onSurface: AppColors.white,
      secondary: AppColors.ogrange,
      surface: AppColors.lighterBlue,
    ),
    primarySwatch: Colors.blueGrey,
  );

  //static final darkTheme = ThemeData.from(colorScheme: colorScheme)
}

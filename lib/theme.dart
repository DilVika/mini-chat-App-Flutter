import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'resources/resources.dart';

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
        shadow: AppColors.lightGray,
      ),
      primarySwatch: Colors.blueGrey,
      scaffoldBackgroundColor: AppColors.darkBlue,
      hoverColor: AppColors.lightGray, // Placeholder color

      // Text Theme
      textTheme: AppTextTheme.defaultTextTheme,

      //iconTheme
      iconTheme: const IconThemeData(
        color: AppColors.white,
        size: Dimensions.defaultIconSize,
      ),
      splashFactory: InkRipple.splashFactory,
      cupertinoOverrideTheme: const CupertinoThemeData(
        scaffoldBackgroundColor: AppColors.white,
        primaryColor: AppColors.white,
        primaryContrastingColor: AppColors.darkBlue,
        brightness: Brightness.light,
      ));

  static final darkTheme = ThemeData.from(
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
  );
}

class AppTextTheme {
  static final defaultTextTheme = Typography.whiteCupertino
      .apply(
        fontFamily: GoogleFonts.workSans().fontFamily,
        displayColor: AppColors.white,
      )
      .copyWith(
        headlineSmall: const TextStyle(
          fontSize: Dimensions.largeTextSize,
          fontStyle: FontStyle.normal,
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: const TextStyle(
          fontSize: Dimensions.smallTextSize,
          fontStyle: FontStyle.normal,
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: const TextStyle(
          fontSize: Dimensions.defaultTextSize,
          fontStyle: FontStyle.normal,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        ),

        //bodyMedium  with black color
        bodyMedium: const TextStyle(
          fontSize: Dimensions.smallTextSize,
          fontStyle: FontStyle.normal,
          color: AppColors.black,
          fontWeight: FontWeight.w400,
        ),
        //Label Lagrge with black color
        labelLarge: const TextStyle(
          fontSize: Dimensions.smallTextSize,
          fontStyle: FontStyle.normal,
          color: AppColors.greyMinor,
          fontWeight: FontWeight.w400,
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_password_generator/core/styles/colors_theme_light.dart';

abstract class AppThemeLight {
  static final ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.light(
      primary: ColorsThemeLight.primaryColor,
      primaryVariant: ColorsThemeLight.primaryDarkColor,
      secondary: ColorsThemeLight.secondaryColor,
      secondaryVariant: ColorsThemeLight.secondaryDarkColor,
    ),
    primaryTextTheme: GoogleFonts.inconsolataTextTheme(
      ThemeData.light().primaryTextTheme,
    ),
    textTheme: GoogleFonts.inconsolataTextTheme(
      ThemeData.light().textTheme,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: ColorsThemeLight.primaryLightColor,
        textStyle: TextStyle(letterSpacing: 2),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        primary: ColorsThemeLight.secondaryTextColor,
      ),
    ),
    appBarTheme: AppBarTheme(color: ColorsThemeLight.primaryLightColor),
    toggleButtonsTheme: ToggleButtonsThemeData(
      fillColor: ColorsThemeLight.primaryLightColor,
      color: ColorsThemeLight.primaryDarkColor,
      selectedColor: ColorsThemeLight.secondaryTextColor,
      borderWidth: 2,
      borderColor: ColorsThemeLight.primaryLightColor,
      selectedBorderColor: ColorsThemeLight.primaryColor,
      textStyle: TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        letterSpacing: 3,
      ),
    ),
  );
}

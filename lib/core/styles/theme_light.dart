import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_password_generator/core/styles/colors_theme_light.dart';

abstract class AppThemeLight {
  static final ThemeData themeData = ThemeData.light().copyWith(
    primaryColor: ColorsThemeLight.primaryColor,
    accentColor: ColorsThemeLight.secondaryColor,
    primaryColorDark: ColorsThemeLight.primaryDarkColor,
    primaryColorLight: ColorsThemeLight.primaryLightColor,
    primaryTextTheme: GoogleFonts.inconsolataTextTheme(
      ThemeData.light().primaryTextTheme,
    ),
    textTheme: GoogleFonts.inconsolataTextTheme(
      ThemeData.light().textTheme,
    ),
    highlightColor: ColorsThemeLight.primaryLightColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(letterSpacing: 2),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        primary: ColorsThemeLight.secondaryTextColor,
        backgroundColor: ColorsThemeLight.primaryLightColor,
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

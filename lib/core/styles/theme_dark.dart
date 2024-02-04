import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_password_generator/core/styles/colors_theme_dark.dart';

abstract class AppThemeDark {
  static final ThemeData themeData = ThemeData.dark().copyWith(
    primaryColor: ColorsThemeDark.primaryColor,
    primaryColorDark: ColorsThemeDark.primaryDarkColor,
    primaryColorLight: ColorsThemeDark.primaryLightColor,
    scaffoldBackgroundColor: ColorsThemeDark.primaryLightColor,
    textTheme: GoogleFonts.inconsolataTextTheme(
      ThemeData.dark().textTheme.copyWith(
            displaySmall: const TextStyle(
              color: ColorsThemeDark.primaryTextColor,
            ),
            headlineMedium: const TextStyle(
              color: ColorsThemeDark.primaryTextColor,
            ),
            titleLarge: const TextStyle(
              color: ColorsThemeDark.primaryTextColor,
            ),
          ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsThemeDark.primaryDarkColor,
      foregroundColor: ColorsThemeDark.primaryTextColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: ColorsThemeDark.primaryTextColor, textStyle: const TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          backgroundColor: ColorsThemeDark.primaryLightColor),
    ),
    appBarTheme: const AppBarTheme(color: ColorsThemeDark.primaryColor),
    toggleButtonsTheme: ToggleButtonsThemeData(
      fillColor: ColorsThemeDark.primaryLightColor,
      color: ColorsThemeDark.secondaryLightColor,
      selectedColor: ColorsThemeDark.primaryTextColor,
      textStyle: const TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        letterSpacing: 3,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: ColorsThemeDark.secondaryColor),
  );
}

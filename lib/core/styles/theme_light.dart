import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_password_generator/core/styles/colors_theme_light.dart';

abstract class AppThemeLight {
  static final ThemeData themeData = ThemeData.light().copyWith(
    primaryColor: ColorsThemeLight.primaryColor,
    primaryColorDark: ColorsThemeLight.primaryDarkColor,
    primaryColorLight: ColorsThemeLight.primaryLightColor,
    primaryTextTheme: GoogleFonts.inconsolataTextTheme(
      ThemeData.dark().primaryTextTheme,
    ),
    textTheme: GoogleFonts.inconsolataTextTheme(
      ThemeData.dark().textTheme.copyWith(
            displaySmall: const TextStyle(
              color: ColorsThemeLight.secondaryTextColor,
            ),
            headlineMedium: const TextStyle(
              color: ColorsThemeLight.primaryDarkColor,
            ),
            titleLarge: const TextStyle(
              color: ColorsThemeLight.secondaryTextColor,
            ),
          ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsThemeLight.primaryLightColor,
      foregroundColor: ColorsThemeLight.secondaryLightColor,
    ),
    iconTheme: const IconThemeData(color: ColorsThemeLight.secondaryLightColor),
    highlightColor: ColorsThemeLight.primaryLightColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorsThemeLight.secondaryLightColor, textStyle: const TextStyle(
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: ColorsThemeLight.primaryLightColor,
      ),
    ),
    appBarTheme: const AppBarTheme(color: ColorsThemeLight.primaryLightColor),
    toggleButtonsTheme: ToggleButtonsThemeData(
      fillColor: ColorsThemeLight.primaryLightColor,
      color: ColorsThemeLight.primaryDarkColor,
      selectedColor: ColorsThemeLight.secondaryLightColor,
      textStyle: const TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        letterSpacing: 3,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: ColorsThemeLight.secondaryColor),
  );
}

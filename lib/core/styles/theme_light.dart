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
            headline3: TextStyle(
              color: ColorsThemeLight.secondaryTextColor,
            ),
            headline4: TextStyle(
              color: ColorsThemeLight.primaryDarkColor,
            ),
            headline6: TextStyle(
              color: ColorsThemeLight.secondaryTextColor,
            ),
          ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsThemeLight.primaryLightColor,
      foregroundColor: ColorsThemeLight.secondaryLightColor,
    ),
    iconTheme: IconThemeData(color: ColorsThemeLight.secondaryLightColor),
    highlightColor: ColorsThemeLight.primaryLightColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        primary: ColorsThemeLight.secondaryLightColor,
        backgroundColor: ColorsThemeLight.primaryLightColor,
      ),
    ),
    appBarTheme: AppBarTheme(color: ColorsThemeLight.primaryLightColor),
    toggleButtonsTheme: ToggleButtonsThemeData(
      fillColor: ColorsThemeLight.primaryLightColor,
      color: ColorsThemeLight.primaryDarkColor,
      selectedColor: ColorsThemeLight.secondaryLightColor,
      textStyle: TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        letterSpacing: 3,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: ColorsThemeLight.secondaryColor),
  );
}

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
            headline3: TextStyle(
              color: ColorsThemeDark.primaryTextColor,
            ),
            headline4: TextStyle(
              color: ColorsThemeDark.primaryTextColor,
            ),
            headline6: TextStyle(
              color: ColorsThemeDark.primaryTextColor,
            ),
          ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsThemeDark.primaryDarkColor,
      foregroundColor: ColorsThemeDark.primaryTextColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          textStyle: TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          primary: ColorsThemeDark.primaryTextColor,
          backgroundColor: ColorsThemeDark.primaryLightColor),
    ),
    appBarTheme: AppBarTheme(color: ColorsThemeDark.primaryColor),
    toggleButtonsTheme: ToggleButtonsThemeData(
      fillColor: ColorsThemeDark.primaryLightColor,
      color: ColorsThemeDark.secondaryLightColor,
      selectedColor: ColorsThemeDark.primaryTextColor,
      textStyle: TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        letterSpacing: 3,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: ColorsThemeDark.secondaryColor),
  );
}

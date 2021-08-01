import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_password_generator/core/styles/colors_theme_dark.dart';

abstract class AppThemeDark {
  static final ThemeData themeData = ThemeData.dark().copyWith(
    primaryColor: ColorsThemeDark.primaryColor,
    accentColor: ColorsThemeDark.secondaryColor,
    primaryColorDark: ColorsThemeDark.primaryDarkColor,
    primaryColorLight: ColorsThemeDark.primaryLightColor,
    primaryTextTheme: GoogleFonts.inconsolataTextTheme(
      ThemeData.dark().primaryTextTheme,
    ),
    textTheme: GoogleFonts.inconsolataTextTheme(
      ThemeData.dark().textTheme,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: TextStyle(letterSpacing: 2),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        primary: ColorsThemeDark.primaryTextColor,
        backgroundColor: ColorsThemeDark.primaryLightColor
      ),
    ),
    appBarTheme: AppBarTheme(color: ColorsThemeDark.primaryColor),
    toggleButtonsTheme: ToggleButtonsThemeData(
      fillColor: ColorsThemeDark.primaryLightColor,
      color: ColorsThemeDark.secondaryLightColor,
      selectedColor: ColorsThemeDark.primaryTextColor,
      borderWidth: 2,
      borderColor: ColorsThemeDark.secondaryLightColor,
      selectedBorderColor: ColorsThemeDark.secondaryTextColor,
      textStyle: TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        letterSpacing: 3,
      ),
    ),
  );
}

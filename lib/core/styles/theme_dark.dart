import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:random_password_generator/core/styles/colors_theme_dark.dart';
import 'package:random_password_generator/core/styles/text_theme_dark.dart';

abstract class AppThemeDark {
  static ThemeData get() {
    final ThemeData baseTheme = ThemeData(
      colorScheme: ColorScheme.dark(
        primary: ColorsThemeDark.primaryColor,
        primaryVariant: ColorsThemeDark.primaryDarkColor,
        secondary: ColorsThemeDark.secondaryColor,
        secondaryVariant: ColorsThemeDark.secondaryDarkColor,
      ),
    );

    return baseTheme.copyWith(
      primaryTextTheme: TextThemeDark.get(baseTheme: baseTheme),
      textTheme: TextThemeDark.get(baseTheme: baseTheme),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(letterSpacing: 2),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          primary: ColorsThemeDark.primaryTextColor,
        ),
      ),
      appBarTheme: AppBarTheme(color: ColorsThemeDark.primaryColor),
      toggleButtonsTheme: ToggleButtonsThemeData(
        fillColor: ColorsThemeDark.primaryColor,
        color: ColorsThemeDark.secondaryColor,
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
}

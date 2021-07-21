import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

abstract class AppThemeLight {
  static ThemeData get() {
    final ThemeData baseTheme = ThemeData.light();

    return baseTheme.copyWith(
      primaryTextTheme:
          GoogleFonts.inconsolataTextTheme(baseTheme.primaryTextTheme),
      textTheme: GoogleFonts.inconsolataTextTheme(baseTheme.textTheme),
      accentTextTheme: GoogleFonts.inconsolataTextTheme(baseTheme.textTheme),
      accentColor: secondaryColor,
      accentColorBrightness: Brightness.light,
      primaryColor: primaryColor,
      primaryColorLight: primaryColorLight,
      primaryColorBrightness: Brightness.light,
      buttonTheme: baseTheme.buttonTheme.copyWith(
        buttonColor: secondaryColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(letterSpacing: 2),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          primary: textColorPrimary,
          backgroundColor: primaryColor,
        ),
      ),
      sliderTheme: SliderThemeData(
        thumbColor: primaryColor,
        activeTrackColor: primaryColor,
        inactiveTrackColor: primaryColorLight,
      ),
      chipTheme: ChipThemeData.fromDefaults(
        primaryColor: primaryColorLight,
        secondaryColor: secondaryColorLight,
        labelStyle: TextStyle().copyWith(
          color: textColorPrimary,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
        ),
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        fillColor: primaryColor,
        selectedColor: textColorPrimary,
        borderWidth: 2,
        textStyle: TextStyle().copyWith(
          color: textColorPrimary,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
        ),
      ),
      scaffoldBackgroundColor: backgroundColor,
      cardColor: backgroundColor,
      backgroundColor: backgroundColor,
    );
  }
}

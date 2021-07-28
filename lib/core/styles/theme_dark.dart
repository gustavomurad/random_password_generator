import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

abstract class AppThemeDark {
  static ThemeData get() {
    final ThemeData baseTheme = ThemeData.light();

    return baseTheme.copyWith(
      primaryTextTheme:
          GoogleFonts.inconsolataTextTheme(baseTheme.primaryTextTheme),
      textTheme: GoogleFonts.inconsolataTextTheme(baseTheme.textTheme),
      accentTextTheme: GoogleFonts.inconsolataTextTheme(baseTheme.textTheme),
      accentColor: secondaryColorDark,
      accentColorBrightness: Brightness.dark,
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorBrightness: Brightness.dark,
      buttonTheme: baseTheme.buttonTheme.copyWith(
        buttonColor: secondaryColorDark,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(letterSpacing: 2),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          primary: textColorPrimary,
          backgroundColor: primaryColorDark,
        ),
      ),
      sliderTheme: SliderThemeData(
        thumbColor: primaryColorDark,
        activeTrackColor: primaryColorDark,
        inactiveTrackColor: secondaryColorDark,
      ),
      chipTheme: ChipThemeData.fromDefaults(
        primaryColor: primaryColorDark,
        secondaryColor: secondaryColorDark,
        labelStyle: TextStyle().copyWith(
          color: textColorPrimary,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
        ),
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        fillColor: primaryColorDark,
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

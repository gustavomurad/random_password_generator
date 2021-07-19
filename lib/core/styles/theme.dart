import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppTheme {
  static final ThemeData getTheme = _build();

  static ThemeData _build() {
    final ThemeData baseTheme = ThemeData.light();

    return baseTheme.copyWith(
      primaryTextTheme:
          GoogleFonts.inconsolataTextTheme(baseTheme.primaryTextTheme),
      textTheme: GoogleFonts.inconsolataTextTheme(baseTheme.textTheme),
      accentTextTheme: GoogleFonts.inconsolataTextTheme(baseTheme.textTheme),
      accentColor: secondaryColor,
      accentColorBrightness: Brightness.dark,
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      primaryColorBrightness: Brightness.dark,
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
        primaryColor: primaryColor,
        secondaryColor: primaryColorDark,
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
          )),
      switchTheme: SwitchThemeData().copyWith(
        thumbColor: MaterialStateProperty.all<Color>(primaryColor),
        trackColor: MaterialStateProperty.all<Color>(primaryColorDark),
        overlayColor: MaterialStateProperty.all<Color>(primaryColorLight),
      ),
      scaffoldBackgroundColor: backgroundColor,
      cardColor: backgroundColor,
      backgroundColor: backgroundColor,
    );
  }
}

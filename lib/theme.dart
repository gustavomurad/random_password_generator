import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final primaryColor = const Color(0xFFa5a58d);
  static final primaryColorLight = const Color(0xFFd6d6bd);
  static final primaryColorDark = const Color(0xFF767660);

  static final secondaryColor = const Color(0xFFffe8d6);
  static final secondaryColorLight = const Color(0xFFffffff);
  static final secondaryColorDark = const Color(0xFFccb6a5);

  static final backgroundColor = const Color(0xFFfffdf7);
  static final textColor = const Color(0xFF000000);

  static final ThemeData getTheme = _build();

  static ThemeData _build() {
    final ThemeData baseTheme = ThemeData.light();

    return baseTheme.copyWith(
      primaryTextTheme: GoogleFonts.robotoTextTheme(baseTheme.primaryTextTheme),
      textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme),
      accentColor: secondaryColor,
      accentColorBrightness: Brightness.dark,
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      primaryColorBrightness: Brightness.dark,
      buttonTheme: baseTheme.buttonTheme.copyWith(
        buttonColor: secondaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          primary: textColor,
          backgroundColor: primaryColor,
        ),
      ),
      sliderTheme: SliderThemeData(
        thumbColor: primaryColor,
        activeTrackColor: primaryColor,
        inactiveTrackColor: primaryColorLight,
      ),
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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final primaryColor = const Color(0xFF212121);
  static final primaryColorLight = const Color(0xFF484848);
  static final primaryColorDark = const Color(0xFF000000);

  static final secondaryColor = const Color(0xFF757575);
  static final secondaryColorLight = const Color(0xFFa4a4a4);
  static final secondaryColorDark = const Color(0xFF494949);

  static final backgroundColor = const Color(0xFFfffdf7);
  static final textColorPrimary = const Color(0xFFffffff);
  static final textColorSecondary = const Color(0xFFffffff);

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

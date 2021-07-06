import 'package:flutter/material.dart';

const PrimaryColor = const Color(0xFFa5a58d);
const PrimaryColorLight = const Color(0xFFd6d6bd);
const PrimaryColorDark = const Color(0xFF767660);

const SecondaryColor = const Color(0xFFffe8d6);
const SecondaryColorLight = const Color(0xFFffffff);
const SecondaryColorDark = const Color(0xFFccb6a5);

const Background = const Color(0xFFfffdf7);
const TextColor = const Color(0xFF000000);

class AppTheme {
  static final ThemeData theme = _build();

  static ThemeData _build() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      accentColor: SecondaryColor,
      accentColorBrightness: Brightness.dark,
      primaryColor: PrimaryColor,
      primaryColorDark: PrimaryColorDark,
      primaryColorLight: PrimaryColorLight,
      primaryColorBrightness: Brightness.dark,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: SecondaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          primary: TextColor,
          backgroundColor: PrimaryColor,
        ),
      ),
      sliderTheme: SliderThemeData(
        thumbColor: PrimaryColor,
        activeTrackColor: PrimaryColor,
        inactiveTrackColor: PrimaryColorLight,
      ),
      switchTheme: SwitchThemeData().copyWith(
        thumbColor: MaterialStateProperty.all<Color>(PrimaryColor),
        trackColor: MaterialStateProperty.all<Color>(PrimaryColorDark),
        overlayColor: MaterialStateProperty.all<Color>(PrimaryColorLight),
      ),
      scaffoldBackgroundColor: Background,
      cardColor: Background,
      backgroundColor: Background,
      textTheme: base.textTheme.copyWith(
        headline4: base.textTheme.headline6!.copyWith(color: TextColor),
        headline6: base.textTheme.headline6!.copyWith(color: TextColor),
        bodyText2: base.textTheme.bodyText2!.copyWith(color: TextColor),
        bodyText1: base.textTheme.bodyText1!.copyWith(color: TextColor),
      ),
    );
  }
}

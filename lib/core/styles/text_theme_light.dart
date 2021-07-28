import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_password_generator/core/styles/colors_theme_light.dart';

abstract class TextThemeLight {
  static TextTheme get({required ThemeData baseTheme}) => TextTheme(
        bodyText1: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.bodyText1!.copyWith(
            color: ColorsThemeLight.primaryTextColor,
          ),
        ),
        bodyText2: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.bodyText2!.copyWith(
            color: ColorsThemeLight.primaryTextColor,
          ),
        ),
        button: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.button!.copyWith(
            color: ColorsThemeLight.primaryTextColor,
          ),
        ),
        subtitle1: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.subtitle1!.copyWith(
            color: ColorsThemeLight.primaryTextColor,
          ),
        ),
        subtitle2: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.subtitle2!.copyWith(
            color: ColorsThemeLight.primaryTextColor,
          ),
        ),
        caption: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.caption!.copyWith(
            color: ColorsThemeLight.primaryTextColor,
          ),
        ),
        headline1: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.headline1!.copyWith(
            color: ColorsThemeLight.primaryTextColor,
          ),
        ),
        headline2: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.headline2!.copyWith(
            color: ColorsThemeLight.primaryTextColor,
          ),
        ),
        headline3: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.headline3!.copyWith(
            color: ColorsThemeLight.primaryTextColor,
          ),
        ),
        headline4: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.headline4!.copyWith(
            color: ColorsThemeLight.primaryTextColor,
          ),
        ),
        headline5: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.headline5!.copyWith(
            color: ColorsThemeLight.primaryTextColor,
          ),
        ),
        headline6: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.headline6!.copyWith(
            color: ColorsThemeLight.primaryTextColor,
          ),
        ),
        overline: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.overline!.copyWith(
            color: ColorsThemeLight.primaryTextColor,
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_password_generator/core/styles/colors_theme_dark.dart';

abstract class TextThemeDark {
  static TextTheme get({required ThemeData baseTheme}) => TextTheme(
        bodyText1: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.bodyText1!.copyWith(
            color: ColorsThemeDark.primaryTextColor,
          ),
        ),
        bodyText2: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.bodyText2!.copyWith(
            color: ColorsThemeDark.primaryTextColor,
          ),
        ),
        button: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.button!.copyWith(
            color: ColorsThemeDark.primaryTextColor,
          ),
        ),
        subtitle1: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.subtitle1!.copyWith(
            color: ColorsThemeDark.primaryTextColor,
          ),
        ),
        subtitle2: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.subtitle2!.copyWith(
            color: ColorsThemeDark.primaryTextColor,
          ),
        ),
        caption: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.caption!.copyWith(
            color: ColorsThemeDark.primaryTextColor,
          ),
        ),
        headline1: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.headline1!.copyWith(
            color: ColorsThemeDark.primaryTextColor,
          ),
        ),
        headline2: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.headline2!.copyWith(
            color: ColorsThemeDark.primaryTextColor,
          ),
        ),
        headline3: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.headline3!.copyWith(
            color: ColorsThemeDark.primaryTextColor,
          ),
        ),
        headline4: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.headline4!.copyWith(
            color: ColorsThemeDark.primaryTextColor,
          ),
        ),
        headline5: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.headline5!.copyWith(
            color: ColorsThemeDark.primaryTextColor,
          ),
        ),
        headline6: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.headline6!.copyWith(
            color: ColorsThemeDark.primaryTextColor,
          ),
        ),
        overline: GoogleFonts.inconsolata(
          textStyle: baseTheme.textTheme.overline!.copyWith(
            color: ColorsThemeDark.primaryTextColor,
          ),
        ),
      );
}

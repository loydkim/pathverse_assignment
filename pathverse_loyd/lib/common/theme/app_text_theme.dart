import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  /// Example type scale:
  /// https://material.io/design/typography/the-type-system.html#type-scale
  ///
  static TextTheme appTextTheme = TextTheme(
    headline1: GoogleFonts.roboto(
        fontWeight: FontWeight.w400, fontSize: 96, letterSpacing: -1.5),
    headline2: GoogleFonts.roboto(
        fontWeight: FontWeight.w400, fontSize: 60, letterSpacing: -0.5),
    headline3: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 48),
    headline4: GoogleFonts.roboto(
        fontWeight: FontWeight.w500, fontSize: 34, letterSpacing: 0.25),
    headline5: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 24),
    headline6: GoogleFonts.roboto(
        fontWeight: FontWeight.w500, fontSize: 20, letterSpacing: 0.15),
    subtitle1: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 16),
    subtitle2: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 14),
    bodyText1: GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    bodyText2: GoogleFonts.roboto(
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    button: styleW700,
    caption: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 12),
    overline: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 10),
  );

  static TextStyle styleW400 = GoogleFonts.roboto(fontWeight: FontWeight.w400);
  static TextStyle styleW500 = GoogleFonts.roboto(fontWeight: FontWeight.w500);
  static TextStyle styleW600 = GoogleFonts.roboto(fontWeight: FontWeight.w600);
  static TextStyle styleW700 = GoogleFonts.roboto(fontWeight: FontWeight.w700);
}

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

const kEmptyColor = 0x0D000000; // 默认色

/// basic colors
///
const primaryColor = Color.fromRGBO(238, 185, 178, 1);
const primaryColorLight = Color.fromRGBO(231, 196, 181, 1);
const primaryColorDeep = Color.fromRGBO(163, 94, 104, 1);

const accentColor = Color.fromRGBO(209, 211, 212, 1);
const accentColorLight = Color.fromRGBO(241, 241, 242, 1);

const buttonColor = Color.fromRGBO(187, 201, 231, 1);

const body1Color = Color.fromRGBO(88, 89, 91, 1);
const body2Color = Color.fromRGBO(110, 113, 116, 1);
const hintColor = Color.fromRGBO(167, 169, 172, 1);

const bgColor = Colors.white;
const bgColorDeep = Color.fromRGBO(230, 231, 232, 1);

const head3Color = Color.fromRGBO(28, 23, 24, 1);
const head4Color = Color.fromRGBO(72, 73, 75, 1);
const head6Color = Color.fromRGBO(35, 31, 32, 1);

/// Extra Color
const shadowColor = Color.fromRGBO(143, 74, 84, 0.4);

const pinkColor = Color.fromRGBO(247, 201, 210, 1);
const orangeColor = Color.fromRGBO(252, 201, 163, 1);
const orangeColorThin = Color.fromRGBO(252, 236, 230, 1);
const goldColorDeep = Color.fromRGBO(112, 82, 62, 1);

///

TextTheme kTextTheme(theme, [language = 'en']) {
  switch (language) {
    case 'vi':
      return GoogleFonts.montserratTextTheme(theme);
    case 'ar':
      return GoogleFonts.ralewayTextTheme(theme);
    default:
      return GoogleFonts.ralewayTextTheme(theme); // EN
  }
}

TextTheme kHeadlineTheme(theme, [language = 'en']) {
  switch (language) {
    case 'vi':
      return GoogleFonts.montserratTextTheme(theme);
    case 'ar':
      return GoogleFonts.ralewayTextTheme(theme);
    default:
      return GoogleFonts.ralewayTextTheme(theme); // EN
  }
}

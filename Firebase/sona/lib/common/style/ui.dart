import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

const kEmptyColor = 0x0D000000; // 默认色

/// basic colors
const kTeal50 = Color(0xFFE0F2F1); // 淡主
const kTeal100 = Color(0xFF3FC1BE); // 轻主

const kDefaultBackgroundAvatar = '3FC1BE'; // 背景头像
const kDefaultTextColorAvatar = 'EEEEEE'; // 文字颜色头像
const kDefaultAdminBackgroundAvatar = 'EEEEEE'; // Admin 背景头像
const kDefaultAdminTextColorAvatar = '3FC1BE'; // Admin 文字颜色头像

const kTeal400 = Color(0xFF26A69A); // 深主题
const kGrey900 = Color(0xFF263238); // 深背景
const kGrey600 = Color(0xFF546E7A); // 轻背景
const kGrey200 = Color(0xFFEEEEEE); // 白背景
const kGrey400 = Color(0xFF90a4ae); // 淡背景
const kErrorRed = Color(0xFFe74c3c); // 危险色
const kSurfaceWhite = Color(0xFFFFFBFA); // 背景
const kBackgroundWhite = Colors.white; // 白的背景
const kBackgroundAppBar = Color(0xFF26A69A); // AppBar 背景

/// color for theme
const kLightPrimary = Color(0xfffcfcff); // 亮主白
const kLightAccent = Color(0xFF546E7A); // 亮文字
const kDarkAccent = Color(0xffF4F5F5); // 暗文字

const kLightBG = Color(0xffF1F2F3); // 亮背景
const kDarkBG = Color(0xff121212); // 暗背景
const kDarkBgLight = Color(0xff1E1E1E); // 暗背景较亮
const kBadgeColor = Colors.red; // 对立色

TextTheme kTextTheme(theme, String language) {
  switch (language) {
    case 'vi':
      return GoogleFonts.montserratTextTheme(theme);
    case 'ar':
      return GoogleFonts.ralewayTextTheme(theme);
    default:
      return GoogleFonts.ralewayTextTheme(theme);
  }
}

TextTheme kHeadlineTheme(theme, [language = 'en']) {
  switch (language) {
    case 'vi':
      return GoogleFonts.montserratTextTheme(theme);
    case 'ar':
      return GoogleFonts.ralewayTextTheme(theme);
    default:
      return GoogleFonts.ralewayTextTheme(theme);
  }
}

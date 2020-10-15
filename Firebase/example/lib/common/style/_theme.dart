import 'package:flutter/material.dart';

import './_ui.dart';

IconThemeData _customIconTheme(IconThemeData original) {
  return original.copyWith(color: primaryColorDeep);
}

const ColorScheme kColorScheme = ColorScheme(
  primary: Colors.white,
  primaryVariant: primaryColorDeep,
  secondary: primaryColorLight,
  secondaryVariant: primaryColorDeep,
  surface: bgColor,
  background: buttonColor,
  error: Colors.red,
  onPrimary: primaryColorDeep,
  onSecondary: primaryColorDeep,
  onSurface: primaryColorDeep,
  onBackground: primaryColorDeep,
  onError: Colors.white,
  brightness: Brightness.light,
);

TextTheme _buildTextTheme(TextTheme base, int typed) {
  return kTextTheme(base).copyWith(
    // body1: base.bodyText1.copyWith(fontWeight: FontWeight.w600, color: body1Color),
    // body2: base.bodyText2.copyWith(color: body2Color),
    headline1: base.headline1
        .copyWith(color: head3Color, fontWeight: FontWeight.bold, fontSize: 48),
    headline2: base.headline2.copyWith(color: head3Color, fontSize: 36),
    headline3: base.headline3.copyWith(color: head3Color, fontSize: 26),
    headline4: base.headline4.copyWith(color: head4Color, fontSize: 20),
    headline5: base.headline5
        .copyWith(color: head4Color, fontSize: 16, fontWeight: FontWeight.w500),
    headline6: base.headline6.copyWith(color: head6Color, fontSize: 14),
  );
  /*
  .copyWith(
    headline5: base.headline5
        .copyWith(fontWeight: FontWeight.w500), // , color: Colors.red),
    headline6: base.headline6.copyWith(fontSize: 18.0),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    subtitle1: base.subtitle1.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 16.0,
    ),
    button: base.button.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  )
      .apply(
        displayColor: disabledColor,
        bodyColor: primaryColor,
      )
      .copyWith(headline4: kHeadlineTheme(base).headline4.copyWith());*/
}

buildLightTheme(String lang) {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    buttonColor: buttonColor,
    textSelectionColor: Color.fromRGBO(0, 168, 243, 1),
    errorColor: Colors.red,
    buttonTheme: const ButtonThemeData(
        colorScheme: kColorScheme,
        textTheme: ButtonTextTheme.normal,
        buttonColor: buttonColor),
    primaryColorLight: primaryColorLight,
    primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildTextTheme(base.textTheme, 0),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme, 0),
    accentTextTheme: _buildTextTheme(base.accentTextTheme, 0),
    iconTheme: _customIconTheme(base.iconTheme),
    hintColor: hintColor, // 用于提示文本或占位符文本的颜色，例如在TextField中

    primaryColorDark: primaryColorDeep,
    disabledColor: base.disabledColor,
    // splashColor: primaryColor,
    bottomAppBarColor: primaryColor,

    backgroundColor: Colors.white,
    primaryColor: primaryColor,
    accentColor: accentColor,
    cursorColor: accentColorLight,

    scaffoldBackgroundColor: bgColor,

    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: primaryColor,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      iconTheme: IconThemeData(
        color: primaryColorDeep,
      ),
    ),
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    }),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black,
      labelPadding: EdgeInsets.zero,
      labelStyle: TextStyle(fontSize: 13),
      unselectedLabelStyle: TextStyle(fontSize: 13),
    ),
  );
}

ThemeData buildDarkTheme(String lang) {
  final ThemeData base = ThemeData.dark();
  return base;
}

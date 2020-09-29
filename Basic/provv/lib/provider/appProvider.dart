import 'package:flutter/material.dart';

class AppModel with ChangeNotifier {
  ThemeData themeData;

  bool darkness;

  String key = '';

  AppModel(darkness) {
    this.darkness = darkness;
    launchTheme();
  }

  void launchTheme() {
    if (this.darkness) {
      themeData = ThemeData.dark();
    } else {
      themeData = ThemeData.light();
    }

    notifyListeners(); // 通知
  }

  void reverseTheme() {
    this.darkness = !this.darkness;
    launchTheme();
  }

  void changeKey() {
    this.key = 'Eye';
    notifyListeners();
  }
}

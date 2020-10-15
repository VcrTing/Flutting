import 'package:flutter/material.dart';

class AppModel with ChangeNotifier {
  ThemeData themeData;

  bool darkness;

  bool isInit = false;

  AppModel() {
    // getConfig();
  }

  Future<bool> getConfig() async {
    try {
      // 从本地或取样式储存

      isInit = true;
      return true;
    } catch (err) {
      return false;
    }
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

  void changeInit(res) {
    this.isInit = res;
    notifyListeners();
  }
}

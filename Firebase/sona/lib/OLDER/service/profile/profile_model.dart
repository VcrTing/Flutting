import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileModel with ChangeNotifier {
  bool isLogin = false;

  void changeLogin() {
    print('调用cLogin方法');
    this.isLogin = !this.isLogin;
    notifyListeners();
  }
}

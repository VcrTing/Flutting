import 'package:flutter/material.dart';

import 'login.dart';
import 'register.dart';

class Auth extends StatefulWidget {
  Auth({Key key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool loginF = true;

  void loginChange() {
    setState(() => loginF = !loginF);
  }

  @override
  Widget build(BuildContext context) {
    if (loginF) {
      return Login(loginChange: loginChange);
    } else {
      return Register(loginChange: loginChange);
    }
  }
}

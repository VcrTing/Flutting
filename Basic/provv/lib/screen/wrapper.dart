import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:provv/provider/userProvider.dart';
import '../screen/home.dart';

import '../screen/login.dart';

class Wrapper extends StatefulWidget {
  Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    bool isLogin = Provider.of<UserModel>(context, listen: true).isLogin;

    return isLogin == true ? HomeScreen() : LoginScreen();
  }
}

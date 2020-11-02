import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sona/screen/auth/login.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: InkWell(
            child: Text('Register'),
            onTap: () {
              Get.to(LoginScreen());
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebasic/model/user.dart';
import 'package:firebasic/util/loading.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text('Login'),
            ),
            body: Container(
              width: double.infinity,
              child: RaisedButton(
                  child: Text('匿名用户登录'),
                  padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                  onPressed: () {
                    UserModel().siginInAnon();
                  }),
            ),
          );
  }
}

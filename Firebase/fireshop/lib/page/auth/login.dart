import 'package:flutter/material.dart';
import 'package:fireshop/model/user.dart';
import 'package:fireshop/util/loading.dart';
import 'package:fireshop/util/constain.dart';
import 'package:path/path.dart';
import 'package:fireshop/page/auth/login_phone.dart';

class Login extends StatefulWidget {
  final Function loginChange;
  Login({Key key, this.loginChange}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final UserModel userApi = UserModel();

  // Login with Email
  String email = '';
  String pass = '';
  String error = '';

  void _showSettingPanel(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: PhoneLoginView(),
          );
        });
  }

  Widget loginForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Email'),
              validator: (value) => value.isEmpty ? 'Enter an email' : null,
              onChanged: (value) {
                setState(() => email = value);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Password'),
              validator: (value) =>
                  value.length < 6 ? 'Enter a password 3+ chars long' : null,
              obscureText: true,
              onChanged: (value) {
                setState(() => pass = value);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              color: Colors.pink,
              child: Text(
                '登录',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  setState(() => loading = true);
                  dynamic result =
                      await userApi.signInWithEmailAndPassword(email, pass);
                  if (result == null) {
                    setState(() {
                      error = 'Could not sign in with those credentials';
                      loading = false;
                    });
                  }
                }
              },
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
          ],
        ));
  }

  Widget phoneLogin(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              _showSettingPanel(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  borderRadius: BorderRadius.circular(60)),
              child: Icon(
                Icons.phone_android,
                color: Colors.white,
              ),
              width: 60,
              height: 60,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text('Login'),
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () => widget.loginChange(),
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    label: Text(
                      '注册',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            body: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Column(
                children: <Widget>[loginForm(), phoneLogin(context)],
              ),
            ),
          );
  }
}

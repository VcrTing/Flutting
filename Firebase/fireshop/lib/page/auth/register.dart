import 'package:flutter/material.dart';

import 'package:fireshop/model/user.dart';
import 'package:fireshop/util/loading.dart';
import 'package:fireshop/util/constain.dart';

class Register extends StatefulWidget {
  final Function loginChange;
  Register({Key key, this.loginChange}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final _formPhoneKey = GlobalKey<FormState>();
  final UserModel userApi = UserModel();

  //
  String email = '';
  String pass = '';
  String error = '';

  // Login with Phone
  String phone = '';
  String chars = '';
  String errorPhone = '';

  Widget registerForm() {
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
                '注册',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  setState(() => loading = true);
                  dynamic result =
                      await userApi.registerWithEmailAndPassword(email, pass);
                  if (result == null) {
                    setState(() {
                      error = 'Please supply a valid email';
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

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text('Register'),
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
                children: <Widget>[registerForm()],
              ),
            ));
  }
}

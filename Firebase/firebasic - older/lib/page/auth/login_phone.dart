import 'package:flutter/material.dart';
import 'package:firebasic/model/user.dart';
import 'package:firebasic/util/loading.dart';
import 'package:firebasic/util/constain.dart';

class PhoneLoginView extends StatefulWidget {
  PhoneLoginView({Key key}) : super(key: key);

  @override
  _PhoneLoginViewState createState() => _PhoneLoginViewState();
}

class _PhoneLoginViewState extends State<PhoneLoginView> {
  bool loading = false;
  final _formPhoneKey = GlobalKey<FormState>();
  final UserModel userApi = UserModel();

  // Login with Phone
  String phone = '';
  String smsCode = '';
  String errorPhone = '';

  Widget loginByPhone() {
    return Form(
      key: _formPhoneKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Phone Number'),
            validator: (value) => value.isEmpty ? 'Enter an Phone' : null,
            onChanged: (value) {
              setState(() => phone = value);
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Vertify Code'),
            validator: (value) =>
                value.isEmpty ? 'Enter an Vertify Code' : null,
            onChanged: (value) {
              setState(() => smsCode = value);
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
              if (_formPhoneKey.currentState.validate()) {
                setState(() => loading = true);
                dynamic result = await userApi.submitPhoneNumber('+852', phone);
                if (result == null) {
                  setState(() {
                    errorPhone = 'Could not sign in with those credentials';
                    loading = false;
                  });
                }
                print('result = ${result}');
              }
            },
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(errorPhone, style: TextStyle(color: Colors.red, fontSize: 14.0)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Column(
              children: <Widget>[loginByPhone()],
            ),
          );
  }
}

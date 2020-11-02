import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sona/common/style.dart';
import 'package:sona/common/validate/valForm.dart';
import 'package:sona/widget/form.dart';
import 'package:sona/widget/title.dart';

class LoginFormWidget extends StatefulWidget {
  LoginFormWidget({Key key}) : super(key: key);

  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  AnimationController _controller;
  AnimationController _animateController;

  Widget fadeInUp(int timed, Widget child) => FadeInUp(
      manualTrigger: true,
      duration: Duration(milliseconds: timed),
      controller: (controller) => _animateController = controller,
      child: child);

  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String account = '';
  String password = '';

  @override
  void initState() {
    super.initState();

    accountController.value = TextEditingValue(text: '');
    accountController.addListener(() {
      print('account Listener');
    });

    passwordController.value = TextEditingValue(text: '');
    passwordController.addListener(() {
      print('password Listener');
    });
  }

  // 验证 账号
  String valAccount(String v) {
    String resLen = valLength(v, 'account', 4, 30);
    if (resLen != null) {
      return resLen;
    }
    return null;
  }

  // 验证 密码
  String valPassword(String v) {
    String resLen = valLength(v, 'password', 4, 30);
    if (resLen != null) {
      return resLen;
    }
    return null;
  }

  void onSubmit() {
    var _form = _formKey.currentState;

    print('validate');
    if (_form.validate()) {
      _form.save();
      print(account);
      print(password);
    }
  }

  Widget accountPanel() => TextFormField(
      controller: accountController,
      maxLength: 30,
      maxLines: 1,
      cursorColor: kTeal100,
      decoration: brightnessInputDecoration(context, 'Phone / Email', false),
      onSaved: (v) {
        print('Submit V = $v');
        this.account = v;
      },
      onChanged: (v) {
        print('Change account = $v');
      },
      validator: (v) => valPassword(v));

  Widget passwordPanel() => TextFormField(
        controller: passwordController,
        maxLength: 30,
        maxLines: 1,
        cursorColor: kTeal100,
        obscureText: true,
        decoration: brightnessInputDecoration(context, 'Password', true),
        onSaved: (v) {
          print('Submit V = $v');
          this.password = v;
        },
        onChanged: (v) {
          print('Change password = $v');
        },
        validator: (v) => valPassword(v),
      );

  Widget submitButton() => Container(
        width: double.infinity,
        child: RaisedButton(
            shape: StadiumBorder(),
            color: kTeal100,
            padding:
                EdgeInsets.symmetric(horizontal: horizon, vertical: horizonT),
            onPressed: () {
              this.onSubmit();
            },
            child: spacingTitle(context, 'SIGN IN', Colors.white, textM, 2,
                FontWeight.bold, false)),
      );

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            accountPanel(),
            SizedBox(
              height: horizon,
            ),
            passwordPanel(),
            SizedBox(
              height: horizon * 2 + distance,
            ),
            fadeInUp(animateM, submitButton()),
          ],
        ));
  }
}

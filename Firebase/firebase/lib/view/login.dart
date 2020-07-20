import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[space(60), icon(), space(15), form()],
    ));
  }

  Widget space(double numed) {
    return SizedBox(height: numed);
  }

  Widget icon() {
    return Text('FLUTTER');
  }

  Widget form() {
    return Form(
        key: _formKey, //设置globalKey，用于后面获取FormState
        autovalidate: true, //开启自动校验
        child: Column(children: <Widget>[
          TextFormField(
              autofocus: true,
              controller: _unameController,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  icon: Icon(Icons.person)),
              // Name
              validator: (v) {
                return v.trim().length > 0 ? null : "用户名不能为空";
              }),
          TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(
                  labelText: "密码", hintText: "您的登录密码", icon: Icon(Icons.lock)),
              obscureText: true,
              // Pass
              validator: (v) {
                return v.trim().length > 5 ? null : "密码不能少于6位";
              }),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    child: Text('Login'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      // 通过_formKey.currentState 获取FormState后，
                      // 调用validate()方法校验用户名密码是否合法，校验
                      // 通过后再提交数据。
                      if ((_formKey.currentState as FormState).validate()) {
                        // 验证通过提交数据
                      }
                    },
                    /*
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30))),
                      */
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}

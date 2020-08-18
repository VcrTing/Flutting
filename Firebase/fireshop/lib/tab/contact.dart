import 'package:flutter/material.dart';

import 'package:fireshop/util/constain.dart';

import 'package:fireshop/model/user.dart';
import 'package:provider/provider.dart';

import 'package:fireshop/util/notification.dart';
import 'package:fireshop/page/activity/notification.dart';
import 'package:fireshop/util/toast.dart';

class FormView extends StatefulWidget {
  FormView({Key key}) : super(key: key);

  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  // 表单 Key
  final _formKey = GlobalKey<FormState>();
  // 初始化的数据
  List ages = [
    {'name': '80', 'val': 1},
    {'name': '85', 'val': 2},
    {'name': '90', 'val': 3},
    {'name': '95', 'val': 4},
    {'name': '00', 'val': 5}
  ];
  // 收集的数据
  String _currentName;
  int _currentAge;
  String _currentEmail;

  @override
  Widget build(BuildContext context) {
    // 取出 User
    final user = Provider.of<User>(context);
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Text('个人资料表', style: TextStyle(fontSize: 24.0)),
            SizedBox(
              height: 20.0,
            ),
            nameInput(),
            SizedBox(
              height: 20,
            ),
            ageInput(),
            SizedBox(
              height: 20,
            ),
            emailInput(),
            SizedBox(
              height: 20,
            ),
            submitButton(user.uid)
          ],
        ));
  }

  // 提交按钮
  Widget submitButton(String uid) {
    return RaisedButton(
      color: Colors.pink[400],
      padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
      child: Text(
        '提交',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () async {
        print(_currentName);
        print(_currentAge);
        print(_currentEmail);
        if (_formKey.currentState.validate()) {
          // 执行上传
          await UserModel(uid: uid)
              .submitContact(_currentName, _currentAge, _currentEmail);
        }
      },
    );
  }

  // 名字框
  Widget nameInput() {
    return TextFormField(
      initialValue: '',
      decoration: textInputDecoration,
      validator: (val) => val.isEmpty ? 'Please enter a name' : null,
      onChanged: (val) => setState(() => _currentEmail = val),
    );
  }

  // 年龄框
  Widget ageInput() {
    return DropdownButtonFormField(
        decoration: textInputDecoration,
        value: _currentAge,
        items: ages.map((age) {
          return DropdownMenuItem(
            value: age['val'],
            child: Text('${age['name']} 后'),
          );
        }).toList(),
        onChanged: (val) => setState(() => _currentAge = val));
  }

  // 电邮框
  Widget emailInput() {
    return TextFormField(
      initialValue: '',
      decoration: textInputDecoration,
      validator: (val) => val.isEmpty ? 'Please enter a email' : null,
      onChanged: (val) => setState(() => _currentName = val),
    );
  }
}

class Contact extends StatefulWidget {
  Contact({Key key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    alert('Wellcome the FireBasic App!!!');
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          FormView(),
          SizedBox(
            height: 60,
          ),
          notifyButton()
        ],
      ),
    );
  }

  // 提醒
  Widget notifyButton() {
    return RaisedButton(
      child: Text('提醒'),
      onPressed: () {
        Notify notify = Notify(
            context: context,
            addrPage: NotifyActivity(
              canshu: '参数',
            ));
        notify.initNotify();
        notify.simpleNotify(
            0, 'WeelCome', 'You pofile sigin in success!', 'payload');
      },
    );
  }
}

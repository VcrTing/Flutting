import 'package:flutter/material.dart';

import 'package:firebasic/util/constain.dart';

import 'package:firebasic/model/user.dart';
import 'package:provider/provider.dart';

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
            TextFormField(
              initialValue: '',
              decoration: textInputDecoration,
              validator: (val) => val.isEmpty ? 'Please enter a name' : null,
              onChanged: (val) => setState(() => _currentName = val),
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
                decoration: textInputDecoration,
                value: _currentAge,
                items: ages.map((age) {
                  return DropdownMenuItem(
                    value: age['val'],
                    child: Text('${age['name']} 后'),
                  );
                }).toList(),
                onChanged: (val) => setState(() => _currentAge = val)),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: Colors.pink[400],
              padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
              child: Text(
                '提交',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                print(_currentName);
                print(_currentAge);
                if (_formKey.currentState.validate()) {
                  // 执行上传
                  await UserModel(uid: user.uid)
                      .submitContact(_currentName, _currentAge);
                }
              },
            )
          ],
        ));
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: FormView(),
    );
  }
}

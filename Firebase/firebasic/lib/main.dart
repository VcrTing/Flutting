import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './tabs.dart';
import 'package:firebasic/model/user.dart';
import 'package:firebasic/page/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: UserModel().user,
      child: MaterialApp(
        title: 'FireBasic',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'FireBasic'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print(widget.title);
    final user = Provider.of<User>(context);
    if (user != null) {
      return TabBarControllerPage();
    } else {
      return Login();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './tabs.dart';
import 'package:firebasic/model/user.dart';
import 'package:firebasic/page/auth/auth.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_picker/image_picker.dart';

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

    if (user == null) {
      return Auth();
    } else {
      return TabBarControllerPage();
    }
  }
}

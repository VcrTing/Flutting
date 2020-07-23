import 'package:flutter/material.dart';

import './view/home.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Andri',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Home Page'),
      /*
      routes: <String, WidgetBuilder>{
        // '/a': (BuildContext context) => new MyPage(title: 'A 页面'),
      },
      */
    );
  }
}

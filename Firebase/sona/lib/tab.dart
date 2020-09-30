import 'package:flutter/material.dart';
import 'package:sona/screen/home.dart';

class MainTab extends StatefulWidget {
  MainTab({Key key}) : super(key: key);

  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

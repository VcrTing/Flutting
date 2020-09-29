import 'package:flutter/material.dart';

// 还未被使用

class AppInit extends StatefulWidget {
  final Function onNext;
  AppInit({this.onNext});

  @override
  _AppInitState createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> {
  @override
  Widget build(BuildContext context) {
    return widget.onNext();
  }
}

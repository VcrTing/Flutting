import 'package:example/common/style/_contain.dart';
import 'package:example/common/style/_ui.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 90),
      color: primaryColorDeep,
      child: Center(
        child: Column(
          children: [
            Text(
              '启动页',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  letterSpacing: distance,
                  decoration: TextDecoration.none),
            ),
            SizedBox(
              height: horizon,
            ),
            Text(
              '这里放一些图片',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  letterSpacing: distance,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}

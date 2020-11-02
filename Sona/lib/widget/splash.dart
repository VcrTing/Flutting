import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/common/style/ui.dart';
import 'package:sona/widget/animate.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 8,
          left: horizon,
          right: horizon),
      color: kTeal100, // Theme.of(context).buttonColor,
      child: Center(
        child: LottieAnimation(
          lottieCode: 'room',
        ),
      ),
    );
  }
}

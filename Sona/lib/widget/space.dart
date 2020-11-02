import 'package:flutter/material.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/widget/animate.dart';

Widget paddingLine(BuildContext context, double padding) => Container(
      height: 1,
      margin: EdgeInsets.only(top: padding),
      color: Theme.of(context).scaffoldBackgroundColor,
    );

Widget defContent() => Container(
      width: double.infinity,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(horizontal: horizon, vertical: horizon * 6),
      child: Text(
        'There is nothing here.',
        style: TextStyle(fontSize: textL),
      ),
    );

Widget nothingPanel(BuildContext context) => Container(
      alignment: Alignment.center,
      width: double.infinity,
      child: LottieAnimation(lottieCode: 'emptyBox'),
    );

Widget defBg(BuildContext context) => Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
    );

import 'package:flutter/material.dart';
import 'package:sona/common/style.dart';
import 'package:sona/common/util/time.dart';

Widget singleTitle(BuildContext context, String named) => Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.symmetric(horizontal: horizon),
    child: Text(
      named,
      style: Theme.of(context)
          .textTheme
          .bodyText1
          .copyWith(fontSize: textM, fontWeight: FontWeight.bold),
    ));

Widget customTitle(BuildContext context, String named, Color color, double size,
        [FontWeight bold]) =>
    Text(
      named,
      style: Theme.of(context).textTheme.bodyText1.copyWith(
          color: color == null
              ? Theme.of(context).textTheme.bodyText1.color
              : color,
          fontWeight: bold == null
              ? Theme.of(context).textTheme.bodyText1.fontWeight
              : bold,
          fontSize: size),
    );

Widget spacingTitle(BuildContext context, String named, Color color,
    double size, double spcing, FontWeight bold, bool txtTyped) {
  // header or body
  TextStyle txtStyle = txtTyped
      ? Theme.of(context).textTheme.headline6.copyWith(
          color: color == null
              ? Theme.of(context).textTheme.bodyText1.color
              : color,
          fontWeight: bold == null
              ? Theme.of(context).textTheme.bodyText1.fontWeight
              : bold,
          fontSize: size,
          letterSpacing: spcing)
      : Theme.of(context).textTheme.bodyText1.copyWith(
          color: color == null
              ? Theme.of(context).textTheme.bodyText1.color
              : color,
          fontWeight: bold == null
              ? Theme.of(context).textTheme.bodyText1.fontWeight
              : bold,
          fontSize: size,
          letterSpacing: spcing);

  return Text(named, style: txtStyle);
}

Widget customHeader(
        BuildContext context, String named, Color color, double size,
        [FontWeight bold]) =>
    Text(
      named,
      style: Theme.of(context).textTheme.headline6.copyWith(
          color: color == null
              ? Theme.of(context).textTheme.bodyText1.color
              : color,
          fontWeight: bold == null
              ? Theme.of(context).textTheme.bodyText1.fontWeight
              : bold,
          fontSize: size),
    );

Widget largeTitle(BuildContext context, String named) => Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Text(
        named,
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: textS * 2, fontWeight: FontWeight.bold),
      ),
    );

Widget subTitle(BuildContext context, String named) => Text(
      named,
      style: Theme.of(context)
          .textTheme
          .bodyText1
          .copyWith(fontSize: textS, color: Colors.black26),
    );

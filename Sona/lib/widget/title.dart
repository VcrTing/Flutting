import 'package:flutter/material.dart';
import 'package:sona/common/style.dart';
import 'package:sona/common/util/time.dart';

Widget justTitle(BuildContext context, String named, Color color) => Text(
      named,
      style: Theme.of(context)
          .textTheme
          .bodyText1
          .copyWith(fontSize: textM, fontWeight: FontWeight.bold, color: color),
    );

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

Widget centerTitle(BuildContext context, String named) => Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: horizon),
      child: Text(
        named,
        style: Theme.of(context).textTheme.bodyText1.copyWith(
            fontSize: textS * 2,
            color: Colors.black,
            fontWeight: FontWeight.bold),
      ),
    );

Widget subTitle(BuildContext context, String named) => Text(
      named,
      style: Theme.of(context)
          .textTheme
          .bodyText1
          .copyWith(fontSize: textS, color: Colors.black26),
    );

import 'package:flutter/material.dart';
import 'package:sona/common/style/distance.dart';

Widget paddingLine(BuildContext context, double padding) => Container(
      height: 1,
      margin: EdgeInsets.only(top: padding),
      color: Theme.of(context).scaffoldBackgroundColor,
    );

Widget defContent() => Container(
      padding: EdgeInsets.symmetric(vertical: horizon),
      margin: EdgeInsets.only(top: horizon * 6),
      child: Text('暂无商品'),
    );

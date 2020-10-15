import 'package:example/common/style/_ui.dart';
import 'package:flutter/material.dart';

Widget linearLine(BuildContext context, [linearNum = 0.8]) => Container(
      height: 4,
      width: double.infinity,
      child: Text(' '),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        stops: [0, linearNum, 1],
        colors: <Color>[
          Theme.of(context).primaryColorDark,
          orangeColorThin,
          Theme.of(context).primaryColorLight,
        ],
        tileMode: TileMode.mirror,
      )),
    );

LinearGradient geadientLinear(BuildContext context, double linearNum) =>
    LinearGradient(
      stops: [0, linearNum, 1],
      colors: <Color>[
        Theme.of(context).primaryColorDark,
        orangeColorThin,
        Theme.of(context).primaryColorDark,
      ],
      tileMode: TileMode.mirror,
    );

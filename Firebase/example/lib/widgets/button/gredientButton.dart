import 'package:example/common/style.dart';
import 'package:flutter/material.dart';

Widget shanningButton(BuildContext context, String txt) =>
/* ShaderMask(
    shaderCallback: (Rect bounds) {
      return RadialGradient(
          center: Alignment(-1, -1),
          radius: 2.4,
          colors: <Color>[
            orangeColorThin,
            orangeColor.withOpacity(0.7),
            goldColorDeep
          ],
          stops: [
            0,
            0.4,
            1
          ]).createShader(bounds);
    },
    blendMode: BlendMode.color,
    child: */
    Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: orangeColor,
        gradient: RadialGradient(
            center: Alignment(-1, -1),
            radius: 2.4,
            colors: <Color>[
              orangeColorThin,
              orangeColor.withOpacity(0.7),
              goldColorDeep
            ],
            stops: [
              0,
              0.4,
              1
            ]),
      ),
      child: Container(
        alignment: Alignment.center,
        padding:
            EdgeInsets.symmetric(horizontal: horizon, vertical: distance - 1),
        decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).backgroundColor, width: 1)),
        child: Text(
          txt,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.white, fontSize: 20),
        ),
      ),
    );

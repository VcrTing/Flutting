import 'package:example/common/style/_contain.dart';
import 'package:example/common/style/_ui.dart';
import 'package:flutter/material.dart';

Widget confirmButton(BuildContext context, String txt) => FlatButton(
    onPressed: () => print('立即 confirmButton'),
    // shape: ,
    color: Theme.of(context).primaryColorLight,
    padding: EdgeInsets.symmetric(vertical: distance, horizontal: distance),
    child: Container(
      padding: EdgeInsets.symmetric(
          horizontal: horizonL * 3, vertical: distance * 3),
      decoration: BoxDecoration(
          border:
              Border.all(color: Theme.of(context).backgroundColor, width: 1)),
      child: Text(
        txt,
        style: Theme.of(context)
            .textTheme
            .headline5
            .copyWith(color: Colors.white, fontWeight: FontWeight.w200),
      ),
    ));

Widget primaryButton(BuildContext context, String txt, Function func) =>
    FlatButton(
        // onPressed: () => print('立即 primaryButton'),
        onPressed: () {
          func();
        },
        // shape: ,
        color: Theme.of(context).buttonColor,
        padding: EdgeInsets.all(4),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: horizon * 3, vertical: 1),
          decoration: BoxDecoration(
              border: Border.all(
                  color: Theme.of(context).backgroundColor, width: 1)),
          child: Text(
            txt,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.white, fontSize: 22),
          ),
        ));

Widget nearButton(BuildContext context, String txt) => Container(
      color: orangeColor,
      padding: EdgeInsets.all(3),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 1),
        decoration: BoxDecoration(
            border:
                Border.all(color: Theme.of(context).backgroundColor, width: 1)),
        child: Text(
          txt,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.white, fontSize: 14),
        ),
      ),
    );

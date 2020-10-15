import 'package:example/common/style/_contain.dart';
import 'package:example/common/style/_ui.dart';
import 'package:flutter/material.dart';

Widget outlinePink(BuildContext context, String txt, Function func) =>
    OutlineButton(
      padding: EdgeInsets.symmetric(vertical: (horizon / 2) + 1),
      onPressed: func,
      borderSide: BorderSide(color: pinkColor, width: 2),
      child: Text(txt,
          style:
              Theme.of(context).textTheme.headline4.copyWith(color: pinkColor)),
    );

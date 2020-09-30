import 'package:flutter/material.dart';
import 'package:sona/common/style/ui.dart';

import 'loading.dart';

class Def extends StatefulWidget {
  Def({Key key}) : super(key: key);

  @override
  _DefState createState() => _DefState();
}

class _DefState extends State<Def> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ,
      home: Container(
        color: kLightPrimary,
        padding: EdgeInsets.only(top: 120),
        child: Center(
          child: Loading(),
        ),
      ),
    );
  }
}

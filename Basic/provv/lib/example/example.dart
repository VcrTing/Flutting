import 'package:flutter/material.dart';

import './animations_example/animations.dart';

class ExampleApp extends StatefulWidget {
  ExampleApp({Key key}) : super(key: key);

  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              child: Text('Dump to Animations page.'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return TransformExample();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}

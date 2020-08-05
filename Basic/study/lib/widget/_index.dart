import '../widget/gestureDetector.dart';
import 'package:flutter/material.dart';
import 'package:study/util/space.dart';

import './gestureDetector.dart';

class WidgetView extends StatefulWidget {
  WidgetView({Key key}) : super(key: key);

  @override
  _WidgetViewState createState() => _WidgetViewState();
}

class _WidgetViewState extends State<WidgetView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[Text('Widget 列表:'), EMPTY(30), everyWidget()],
      ),
    );
  }

  Widget everyWidget() {
    return Container(
        child: ListTile(
      leading: Icon(
        Icons.person_outline,
        size: 50.0,
      ),
      title: Text('gestureDetector'),
      subtitle: Text('检测“单击”、“双击”、“长按”。'),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        print('aaaaa');

        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return WidgetGestureDetector();
        }));
      },
    ));
  }
}

class WidgetIndex extends StatefulWidget {
  WidgetIndex({Key key}) : super(key: key);

  @override
  _WidgetIndexState createState() => _WidgetIndexState();
}

class _WidgetIndexState extends State<WidgetIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*
        leading: RaisedButton(
          child: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        */
        title: Text('Widget'),
      ),
      body: Container(
        width: double.infinity,
        child: WidgetView(),
      ),
    );
  }
}

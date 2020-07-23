import '../widget/gestureDetector.dart';
import 'package:flutter/material.dart';

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
        children: <Widget>[
          Text('Widget 列表:'),
          ListView(
            children: buildList(),
          )
        ],
      ),
    );
  }

  List<Widget> buildList() {
    return [
      ListTile(
        leading: Icon(Icons.access_time),
        title: Text('GestureDetector'),
        onTap: () {
          print('跳转到 GestureDetector。');
        },
      )
    ];
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

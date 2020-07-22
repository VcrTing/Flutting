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
        children: <Widget>[Text('Widget 列表:'), buildList()],
      ),
    );
  }

  Widget buildList() {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.access_time),
          title: Text('GestureDetector'),
          onTap: () {
            print('跳转到 GestureDetector。');
          },
        )
      ],
    );
  }
}

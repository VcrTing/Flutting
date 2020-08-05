import 'package:flutter/material.dart';
import 'package:study/util/space.dart';

Widget widget_gestureDetector() {
  /*
  The GestureDetector widget doesn’t have a visual representation but instead detects gestures made by the user. 
  When the user taps the Container, the GestureDetector calls its onTap() callback, 
  in this case printing a message to the console. You can use GestureDetector to detect a variety of input gestures, 
  including taps, drags, and scales.

  Many widgets use a GestureDetector to provide optional callbacks for other widgets. 
  For example, the IconButton, RaisedButton, 
  and FloatingActionButton widgets have onPressed() callbacks that are triggered when the user taps the widget.

  For more information, see Gestures in Flutter.
  */
  return GestureDetector(
    onTap: () {
      print('Classic Tap!!!');
    },
    onLongPress: () {
      print('Classic LongPress!!!');
    },
    onDoubleTap: () {
      print('Classic DoublePress!!!');
    },
    child: Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500]),
      child: Center(
        child: Text('长按，单击，双击 动作检测！'),
      ),
    ),
  );
}

Widget child_gestureDetector() {
  return GestureDetector(
    onTap: () {
      print('Outter ONTAP');
    },
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500]),
      child: AbsorbPointer(
        child: RaisedButton(
          child: Text('子组件'),
          onPressed: () {
            print('子组件被点击～');
          },
        ),
      ),
    ),
  );
}

class WidgetGestureDetector extends StatelessWidget {
  const WidgetGestureDetector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector'),
      ),
      body: Container(
        child: content(),
      ),
    );
  }

  Widget content() {
    return Column(
      children: <Widget>[
        EMPTY(30),
        Text('经典：'),
        widget_gestureDetector(),
        EMPTY(30),
        Text('阻隔子组件点击：'),
        child_gestureDetector()
      ],
    );
  }
}

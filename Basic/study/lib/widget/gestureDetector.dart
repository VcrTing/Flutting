import 'package:flutter/material.dart';

Widget widget_gestureDetector() {
  return GestureDetector(
    onTap: () {
      print('GestureDetector be Tap!!!');
    },
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500]),
      child: Center(
        child: Text('Engage'),
      ),
    ),
  );
}

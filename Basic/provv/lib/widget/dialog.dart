import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool alertConfirm(String content) {
  AlertDialog(
    title: Text('Accept?'),
    content: Text(content),
    actions: [
      FlatButton(
        child: Text('No'),
        onPressed: () {
          print('No');
          return false;
        },
      ),
      FlatButton(
        child: Text('Yes'),
        onPressed: () {
          print('Yes');
          return true;
        },
      )
    ],
    elevation: 24,
  );
}

bool alertMessage(String content) {
  Fluttertoast.showToast(
    msg: content,
    gravity: ToastGravity.BOTTOM,
    // backgroundColor: Color.fromRGBO(0, 0, 0, 0.5)
  );
}

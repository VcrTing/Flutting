import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void alert(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
      textColor: Colors.white,
      fontSize: 16.0);
}

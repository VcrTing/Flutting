import 'package:flutter/material.dart';

Color hexToColor(String s) {
  if (s == null ||
      s.length != 7 ||
      int.tryParse(s.substring(1, 7), radix: 16) == null) {
    s = '#373737';
  }

  return Color(int.parse(s.substring(1, 7), radix: 16) + 0xff000000);
}

// hexToColor('#f7f7f7')

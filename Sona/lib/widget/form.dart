import 'package:flutter/material.dart';
import 'package:sona/common/style/ui.dart';

InputDecoration brightnessInputDecoration(
    BuildContext context, String numed, bool eye) {
  return InputDecoration(
      hintText: numed,
      counterText: '',
      focusColor: kTeal100,
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kTeal100, width: 2)));
}

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class BarBuilder extends DelegateBuilder {
  @override
  Widget build(BuildContext context, int index, bool active) {
    // TODO: implement build
    return Text('Tab $index');
  }
}

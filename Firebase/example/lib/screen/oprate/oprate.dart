import 'package:flutter/material.dart';

class OperateScreen extends StatefulWidget {
  OperateScreen({Key key}) : super(key: key);

  @override
  _OperateScreenState createState() => _OperateScreenState();
}

class _OperateScreenState extends State<OperateScreen> {
  @override
  Widget build(BuildContext context) {
    print('Operate');
    return Container(
      child: Text('OperateScreen'),
    );
  }
}

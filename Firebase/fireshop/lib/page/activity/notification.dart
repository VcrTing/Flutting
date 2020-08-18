import 'package:flutter/material.dart';

class NotifyActivity extends StatefulWidget {
  String canshu;
  NotifyActivity({Key key, this.canshu}) : super(key: key);

  @override
  _NotifyActivityState createState() => _NotifyActivityState();
}

class _NotifyActivityState extends State<NotifyActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity'),
      ),
      body: Container(
        child: Text('参数 = ${widget.canshu}'),
      ),
    );
  }
}

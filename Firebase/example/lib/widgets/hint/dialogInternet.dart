import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> showDialogNotInternet(BuildContext context) {
  return showDialog(
      context: context,
      child: CupertinoAlertDialog(
        title: Center(
          child: Row(
            children: <Widget>[
              Icon(
                Icons.warning,
              ),
              Text('警告'),
            ],
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text('无网络连接！！'),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: AppSettings.openWIFISettings,
            child: Text('检查网络'),
          )
        ],
      ));
}

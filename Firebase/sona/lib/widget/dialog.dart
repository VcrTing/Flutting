import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sona/l10n/l10n.dart';

Future<dynamic> showDialogNotInternet(BuildContext context) {
  Lang l = Lang('cn');
  return showDialog(
      context: context,
      child: CupertinoAlertDialog(
        title: Center(
          child: Row(
            children: <Widget>[
              Icon(
                Icons.warning,
              ),
              Text(l.getTxt('warning')),
            ],
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(l.getTxt('noInternet')),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: AppSettings.openWIFISettings,
            child: Text(l.getTxt('checkInternet')),
          )
        ],
      ));
}

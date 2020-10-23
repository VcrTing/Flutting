import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import './widget/splash.dart';

import 'common/util.dart';
import 'service/app_model.dart';
import 'widget/dialog.dart';

class AppInit extends StatefulWidget {
  Function onNext;
  AppInit({this.onNext});

  @override
  _AppInitState createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> {
  AppModel _app;
  void _changeInit(res) => _app.changeInit(res);
  @override
  void initState() {
    //
    // 检查网络连接
    MyConnectivity.instance.initialise();
    MyConnectivity.instance.myStream.listen((onData) {
      print("[App] internet issue change: $onData");

      if (MyConnectivity.instance.isIssue(onData)) {
        if (MyConnectivity.instance.isShow == false) {
          MyConnectivity.instance.isShow = true;
          showDialogNotInternet(context).then((onValue) {
            MyConnectivity.instance.isShow = false;
            print("[showDialogNotInternet] dialog closed $onValue");
          });
        }
      } else {
        if (MyConnectivity.instance.isShow == true) {
          // Navigator.of(context).pop();
          print('需执行 Pop');
          MyConnectivity.instance.isShow = false;
        }
      }
    });
    super.initState();
  }

  Future<bool> shared() async {
    try {
      // 拉取本地信息
      // 拉取用户登录信息
      return Future.delayed(Duration(seconds: 3)).then((value) {
        _changeInit(true);
        return true;
      });
    } catch (err) {
      return false;
    }
  }

  Widget backgroundRunner() {
    print('执行背景运行......');

    this.shared().then((value) {
      value ? null : _changeInit(true);
    });
    return SplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    _app = Provider.of<AppModel>(context);

    return _app.isInit ? widget.onNext() : backgroundRunner();
  }
}

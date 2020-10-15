import 'package:pull_to_refresh/pull_to_refresh.dart';

import './common/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'init.dart';
import 'model/appProvider.dart';
import 'tab.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _app = AppModel();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<AppModel>.value(value: _app),
    ], child: _App());
  }
}

class _App extends StatelessWidget {
  const _App({Key key}) : super(key: key);

  ThemeData getTheme(BuildContext context) {
    bool darkness = Provider.of<AppModel>(context).darkness ?? false;

    // 通过 conf 创建
    if (darkness) {
      return buildDarkTheme('en');
    }
    return buildLightTheme('en');
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [RefreshLocalizations.delegate],
      theme: getTheme(context),
      home: AppInit(
          onNext: () => MainTab(
                pageIndex: 1,
              )),
    );
  }
}

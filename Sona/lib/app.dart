import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sona/init.dart';
import 'package:sona/service/app_model.dart';
import 'package:sona/service/profile/profile_model.dart';
import 'package:sona/service/some/gategory/gategory_model.dart';
import 'package:sona/service/some/some_model.dart';
import 'package:sona/tab.dart';

import 'common/style.dart';
import 'common/util.dart';
import 'widget/dialog.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _app = AppModel();
  final _profile = ProfileModel();
  final _some = SomeModel();
  final _gategory = GategoryModel();

  @override
  Widget build(BuildContext context) {
    print('[App Build] 建立 -----');
    return MultiProvider(providers: [
      ChangeNotifierProvider<AppModel>.value(value: _app),
      ChangeNotifierProvider<ProfileModel>.value(value: _profile),
      ChangeNotifierProvider<SomeModel>.value(value: _some),
      ChangeNotifierProvider<GategoryModel>.value(value: _gategory),
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
      theme: getTheme(context),
      home: Scaffold(
          body: AppInit(
        onNext: () => MainTab(
          currentTab: 0,
        ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:provv/util/device/platform.dart';

import 'provider/appProvider.dart';

import 'package:firebase_core/firebase_core.dart';

import './widget/loading.dart';

import './screen/wrapper.dart';
import './screen/some/someScreenOption.dart';
import './screen/some/someScreenTheBlog.dart';
import './screen/user/userScreen.dart';

import './screen/home.dart';
import './screen/login.dart';

import 'common/theme.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  ThemeData getTheme() {
    AppModel appModel = Provider.of<AppModel>(context);
    bool darkness = appModel.darkness ?? false;
    // 加载本地 conf，如果没有 conf 则跳过
    // pass

    // 通过 conf 创建
    if (darkness) {
      return buildDarkTheme('en');
    }
    return buildLightTheme('en');
  }

  // Builder 参数
  Widget builderParam(BoxConstraints constraints) {
    print('LayoutBuilder Param:');
    print(constraints.minWidth);
    print(constraints.minHeight);

    final isTable = isTablet(constraints);
    print('is Tablet = $isTable');
    /*
    MediaQueryData mediaQuery = MediaQuery.of(context);
    print(mediaQuery.size);
    print(mediaQuery.platformBrightness);
    print(mediaQuery.systemGestureInsets);
    */
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      home: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        builderParam(constraints);
        return FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            // 用户无外网条件
            if (snapshot.hasError) {
              return Loading();
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return Wrapper();
            }
            return Loading();
          },
        );
      }),
      routes: Routes.all(),
    );
  }
}

class Routes {
  static Map<String, WidgetBuilder> all() => _routes;

  static final Map<String, WidgetBuilder> _routes = {
    '/some_option': (context) => SomeScreenOption(),
    '/some_theblog': (context) => SomeScreenTheBlog(),
    '/user': (context) => UserScreen(),
    '/home': (context) => HomeScreen(),
    '/login': (context) => LoginScreen()
  };
}

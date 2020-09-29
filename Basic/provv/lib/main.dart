import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provv/provider/someModel.dart';
import 'package:provv/provider/userProvider.dart';
import './_app_firebase.dart';

import 'provider/appProvider.dart';

import 'package:provider/provider.dart';

import './util/device.dart';

Future<void> main() async {
  Provider.debugCheckInvalidValueType = null;
  // Provider
  // 这是普通取值 Provider，无法做到监听更新

  // ChangeNotifierProvider
  // 这是具备 监听更新和取值功能的 常用

  // ListenableProvider
  // 相等于 ChangeNotifierProvider，但是没有 dispose() 方法

  // ValueListenableProvider
  // 很少用

  // StreamProvider
  // 发送 Stream 对象的 Provider

  // FutureProvider
  // 发送一个 Future 对象的 Provider 常用
  // 似乎 Future 对象到来之后会把之前 BuilContext 的内容销毁，

  // ProxyProvider
  // 把上级 Provider 对象类型 转为一个 别的 对象类型 供我们使用

  // 启动前的设置

  /// enable network traffic logging
  WidgetsFlutterBinding.ensureInitialized();
  HttpClient.enableTimelineLogging = true;

  if (!kIsWeb) {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
  }

  // 启动 APP
  runApp(
      /*
    FutureProvider<String>(
        create: (_) {
          return Future.delayed(Duration(seconds: 5), () {
            return 'This is come from future provider.';
          });
        },
        initialData: 'None',
        child: ChangeNotifierProvider(
            create: (_) {
              return AppModel(true);
            },
            child: App())),
    */

      // MultiProvider
      MultiProvider(
    providers: [
      /*
      FutureProvider<String>(
          create: (_) {
            return Future.delayed(Duration(seconds: 5), () {
              return 'This is come from future provider.';
            });
          },
          initialData: 'None'),
          */
      ChangeNotifierProvider(create: (_) {
        return AppModel(false);
      }),
      // 加载
      ChangeNotifierProvider<SomeModel>(
        create: (context) => SomeModel(),
      ),
      ChangeNotifierProvider<UserModel>(create: (context) => UserModel())
    ],
    child: App(),
  ));
}

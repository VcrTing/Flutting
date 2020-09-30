import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sona/widget/def.dart';

import './app.dart';
import './common/constain.dart';

Future<void> main() async {
  // Provider 设定
  Provider.debugCheckInvalidValueType = null;

  // 基础设定
  WidgetsFlutterBinding.ensureInitialized();
  HttpClient.enableTimelineLogging = true;

  if (!kIsWeb) {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
  }

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  runApp(FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.done ? App() : Def()));
}

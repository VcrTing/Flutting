import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../demo/factory_service.dart';
import '../demo/factory_screen.dart';
import '../loading.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<FactoryModel>(
            create: (_) {
              return FactoryModel();
            },
          )
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'SONA',
            home: SafeArea(
              child: FutureBuilder(
                future: _initialization,
                builder: (context, snapshot) =>
                    snapshot.connectionState == ConnectionState.done
                        ? FactoryScreen()
                        : Loading(),
              ),
            )));
  }
}

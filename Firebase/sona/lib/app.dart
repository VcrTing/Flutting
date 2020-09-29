import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sona/firebase/someProvider.dart';
import 'package:sona/firebase/test.dart';
import 'package:sona/some.dart';

import 'loading.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SONA',
        home: SafeArea(
          child: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) => snapshot.connectionState ==
                    ConnectionState.done
                // Provider
                ? MultiProvider(providers: [
                    Provider<String>(
                        create: (_) => 'This is come from Provider'),
                    ChangeNotifierProvider<SomeModel>(
                      create: (_) => SomeModel(),
                    ),
                    FutureProvider<Some>(
                        initialData: null,
                        create: (_) => Future.delayed(Duration(seconds: 3), () {
                              return FirebaseFirestore.instance
                                  .collection('factory')
                                  .doc('eye')
                                  .get()
                                  .then((value) => Some.fromJson(value.data()));
                            }))
                  ], child: TestFire())
                : Loading(),
          ),
        ));
  }
}

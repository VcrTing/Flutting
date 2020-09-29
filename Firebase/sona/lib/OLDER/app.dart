import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../service/factory/factory_model.dart';
import '../service/profile/profile_model.dart';

import 'tab.dart';
import '../loading.dart';
import '../screen/auth/factory.dart';
import '../screen/auth/login.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SONA',
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
            body1: GoogleFonts.oswald(textStyle: textTheme.body1),
          ),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.done
                  ? Wrapper()
                  : Loading(),
        ));
  }
}

class Wrapper extends StatefulWidget {
  Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool isLogin = false;

  Widget going() => isLogin ? Scaffold(body: TabNavigator()) : FactoryScreen();

  final _factory = FactoryModel();

  @override
  Widget build(BuildContext context) {
    // print('name =' + factoryModel.name);
    return MultiProvider(providers: [
      ChangeNotifierProvider<FactoryModel>(
        create: (_) {
          return _factory;
        },
      ),
      ChangeNotifierProvider<ProfileModel>(
        create: (_) {
          return ProfileModel();
        },
      )
    ], child: going());
  }
}

import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// App
class _MyAppState extends State<MyApp> {
  Map _data = {};
  Map _notification = {};

  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _register() {
    print('Register');
    // _firebaseMessaging.getToken().then((token) => print(token));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessage();
  }

  void getMessage() {
    /*
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('on message $message');
      setState(() {
        _notification = message["notification"];
        _data = message['data'];
      });
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() {
        _notification = message["notification"];
        _data = message['data'];
      });
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() {
        _notification = message["notification"];
        _data = message['data'];
      });
    });
    */
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Title: ${_notification['title']}"),
                OutlineButton(
                  child: Text("Register My Device"),
                  onPressed: () {
                    print('Data = ${_data}');
                    _register();
                  },
                ),
                Text("Notification Body: ${_notification['body']}")
              ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provv/example/animations_example/animations.dart';
import 'package:provv/screen/user/userScreen.dart';
import '../screen/some/someScreenInner.dart';
import '../screen/some/someScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void openTrash() {
    someSheet(context);
  }

  void openUser() {
    /*
    Navigator.of(context).pushNamed('/user',
        arguments: {'para': null}).then((value) => print('接收传回来的参数 = $value'));
        */
    Get.to(UserScreen());
  }

  Widget appBarTitle() => Container(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return TransformExample();
          }));
        },
        child: Text('Prov Victor'),
      ));

  Widget appBar() => AppBar(
        leading: GestureDetector(
          child: Icon(Icons.delete_forever),
          onTap: () => openTrash(),
        ),
        title: appBarTitle(),
        actions: [
          Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Hero(
                tag: 'userCenter',
                child: GestureDetector(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      'assets/imgs/AVATAR.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () => openUser(),
                ),
              ))
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar(), body: SomeScreen());
  }
}

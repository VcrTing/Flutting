import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provv/provider/appProvider.dart';

import '../../provider/userProvider.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool darkness = false;
  Widget pageSetting() => Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(3)),
              child: GestureDetector(
                child: Row(
                  children: [
                    Expanded(
                      child: Text('Dark Model'),
                      flex: 4,
                    ),
                    Expanded(
                      child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(left: 5),
                          child: Consumer<AppModel>(
                            builder: (context, value, child) {
                              return Switch(
                                value: value.darkness,
                                // activeColor: Theme.of(context).buttonColor,
                                onChanged: (v) {
                                  value.reverseTheme();
                                },
                              );
                            },
                          )),
                      flex: 1,
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(3)),
              child: GestureDetector(
                child: Row(
                  children: [
                    Expanded(
                      child: Text('Change Account'),
                      flex: 4,
                    ),
                    Expanded(
                      child: Container(
                        child: Icon(Icons.keyboard_arrow_right),
                        height: 40,
                      ),
                      flex: 1,
                    )
                  ],
                ),
                onTap: () {
                  print('切换账号');
                  Provider.of<UserModel>(context, listen: false).loginOut(null);
                  Navigator.of(context).pushNamed('/login');
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(3)),
              child: GestureDetector(
                child: Row(
                  children: [
                    Expanded(
                      child: Text('Exit App'),
                      flex: 4,
                    ),
                    Expanded(
                      child: Container(
                        child: Icon(Icons.keyboard_arrow_right),
                        height: 40,
                      ),
                      flex: 1,
                    )
                  ],
                ),
                onTap: () {
                  print('退出应用');
                  SystemNavigator.pop();
                  exit(0);
                },
              ),
            ),
          ],
        ),
      );
  Widget pageTopBar() => SafeArea(
      child: Container(
          height: 40,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).accentIconTheme.color,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                flex: 1,
              ),
              Expanded(
                child: Text(''),
                flex: 4,
              )
            ],
          )));
  Widget pageAvatar() => Container(
      margin: EdgeInsets.only(top: 360),
      child: Consumer<UserModel>(
        builder: (context, value, child) {
          print('用户姓名页面重绘。');
          return Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Image.asset('assets/imgs/AVATAR.jpg')),
                ),
                flex: 2,
              ),
              Expanded(
                child: Container(
                  height: 90,

                  // color: Colors.black,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                  // margin: EdgeInsets.only(top: 15),
                  child: Text(
                    value.profile == null ? '' : value.profile.name,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                flex: 4,
              )
            ],
          );
        },
      ));
  Widget pageLayout() {
    return Column(
      children: [
        // Bg
        Container(
          height: 475,
          width: double.infinity,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Positioned(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Image.asset(
                    'assets/imgs/SEA_1080_1366.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: pageTopBar(),
              ),
              Positioned(
                child: Hero(
                  tag: 'userCenter',
                  child: pageAvatar(),
                ),
              )
            ],
          ),
        ),
        // Content
        Container(
          height: 0,
          child: Column(
            children: [],
          ),
        ),
        // Setting
        Container(
          margin: EdgeInsets.only(top: 45),
          child: Column(
            children: [pageSetting()],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: pageLayout(),
      ),
    );
  }
}

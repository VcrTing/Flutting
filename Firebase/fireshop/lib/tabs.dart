import 'package:fireshop/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

import './tab/contact.dart';
import './tab/shop.dart';
import './tab/order.dart';

final tabCount = 3;
List<Widget> tabContent = [Contact(), Order(), Shop()];
List<Widget> tabText = [Tab(text: '联络'), Tab(text: '订单'), Tab(text: '商店')];

class TabBarControllerPage extends StatefulWidget {
  int tabIndex = 0;
  TabBarControllerPage({Key key, this.tabIndex}) : super(key: key);

  _TabBarControllerPageState createState() => _TabBarControllerPageState();
}

class _TabBarControllerPageState extends State<TabBarControllerPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  UserModel userApi;
  @override
  void dispose() {
    //生命周期函数：
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    //生命周期函数：
    super.initState();
    _tabController = new TabController(vsync: this, length: tabCount);
    _tabController.addListener(() {
      print(_tabController.index);
    });
    getMessaging();
  }

  // FIREBASE MESSAGING
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  Map currentMsg;

  void _register() {
    print('Register');
    // _firebaseMessaging.getToken().then((token) => print(token));
  }

  void getMessaging() {
    _message(Map<String, dynamic> message) async {
      print('Message = ${message}');
      setState(() {
        currentMsg = message;
      });
    }

    // _firebaseMessaging.configure(onMessage: _message, onLaunch: _message, onResume: _message);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('火基础'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                'LogOut',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                userApi = UserModel();
                await userApi.signOut();
              },
            ),
            FlatButton.icon(
              onPressed: () {
                _register();
              },
              icon: Icon(
                Icons.restore_page,
                color: Colors.white,
              ),
              label: Text(
                '注册',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
          /*
          bottom: TabBar(
            controller: this._tabController,
            tabs: tabText,
          ),
          */
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: this._tabController,
          children: tabContent,
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 2),
          color: Colors.blue,
          child: TabBar(
            controller: this._tabController,
            tabs: tabText,
          ),
        ));
  }
}

import 'package:firebasic/model/user.dart';
import 'package:flutter/material.dart';

import './tab/contact.dart';
import './tab/shop.dart';

final tabCount = 2;
List<Widget> tabContent = [Contact(), Shop()];
List<Widget> tabText = [Tab(text: '联络'), Tab(text: '商店')];

class TabBarControllerPage extends StatefulWidget {
  TabBarControllerPage({Key key}) : super(key: key);

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
    print('Tab 即将终结：');
    print(_tabController.index);
    print('----------------------- <');
  }

  @override
  void initState() {
    //生命周期函数：
    super.initState();
    _tabController = new TabController(vsync: this, length: tabCount);
    _tabController.addListener(() {
      print('Tab 初始化：');
      print(_tabController.index);
      print('----------------------- >');
    });
  }

  @override
  Widget build(BuildContext context) {
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
                await userApi.signOut();
              },
            ),
          ],
          /*
          bottom: TabBar(
            controller: this._tabController,
            tabs: tabText,
          ),
          */
        ),
        body: TabBarView(
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

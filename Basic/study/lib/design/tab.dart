import 'package:flutter/material.dart';

import './tab/hot.dart';
import './tab/recom.dart';

final tabCount = 2;
List<Widget> tabContent = [Hot(), Recom()];
List<Widget> tabText = [Tab(text: '热销'), Tab(text: '推荐')];

class TabBarControllerPage extends StatefulWidget {
  TabBarControllerPage({Key key}) : super(key: key);

  _TabBarControllerPageState createState() => _TabBarControllerPageState();
}

class _TabBarControllerPageState extends State<TabBarControllerPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
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
          title: Text('TabBarController'),
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

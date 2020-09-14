import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import './screen/contact/contact.dart';
import './screen/profile/profile.dart';
import './screen/home/home.dart';

class TabNavigator extends StatefulWidget {
  TabNavigator({Key key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>
    with AutomaticKeepAliveClientMixin {
  int _current = 0;
  PageController _controller;

  List<Widget> pageList = <Widget>[
    HomeScreen(),
    ContactScreen(),
    ProfileScreen()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: pageList,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          // TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.people, title: 'Contact'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        // initialActiveIndex: 2,//optional, default as 0
        onTap: (int i) => _controller.animateToPage(i,
            duration: Duration(microseconds: 260), curve: Curves.easeIn),
      ),
    );
  }
}

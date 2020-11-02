import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sona/common/style.dart';
import 'package:sona/model/profile/profile.dart';
import 'package:sona/screen/home/home.dart';
import 'package:sona/screen/product/product.dart';
import 'package:sona/screen/profile/profile.dart';
import 'package:sona/screen/shopping/shoppingcart.dart';
import 'package:sona/widget/imager.dart';
import 'package:sona/widget/shopping.dart';

class MainTab extends StatefulWidget {
  int currentTab = 0;
  int selectedTab = 0;
  String currentTitle = 'Home';
  Widget currentPage = HomeScreen();

  MainTab({
    Key key,
    this.currentTab,
  }) : super(key: key);

  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  initState() {
    _selectTab(widget.currentTab);
    super.initState();
  }

  @override
  void didUpdateWidget(MainTab oldWidget) {
    _selectTab(oldWidget.currentTab);
    super.didUpdateWidget(oldWidget);
  }

  void _selectTab(int tabItem) {
    setState(() {
      widget.currentTab = tabItem;
      widget.selectedTab = tabItem;
      switch (tabItem) {
        case 0:
          widget.currentTitle = 'Home';
          widget.currentPage = HomeScreen();
          break;
        case 1:
          widget.currentTitle = 'Shopping Cart';
          widget.currentPage = ShoppingCartScreen();
          break;
        case 2:
          widget.currentTitle = 'Account';
          widget.currentPage = ProfileScreen();
          break;
      }
    });
  }

  void goScreen(String uri) {
    Navigator.pushNamed(context, uri);
    _selectTab(0);
  }

  @override
  Widget build(BuildContext context) {
    print('Main Tab 重建 --------------- ');
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        key: _scaffoldKey,
        // drawer: DrawerWidget(),
        body: widget.currentPage,
        appBar: widget.currentTab == 0 ? appBar() : null,
        bottomNavigationBar: bottomBar());
  }

  Widget bottomBar() => BottomNavigationBar(
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).backgroundColor.withOpacity(0.5),
        selectedItemColor: kTeal100,
        // selectedFontSize: 0.0,
        // unselectedFontSize: 0.0,
        iconSize: iconM,
        selectedIconTheme: IconThemeData(size: 25),
        unselectedItemColor: Theme.of(context).accentColor,
        currentIndex: widget.selectedTab,
        onTap: (int i) {
          this._selectTab(i);
        },
        // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
              title: Container(height: 5.0), icon: Icon(Icons.home)
              /*
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).accentColor.withOpacity(0.4),
                        blurRadius: 40,
                        offset: Offset(0, 15)),
                    BoxShadow(
                        color: Theme.of(context).accentColor.withOpacity(0.4),
                        blurRadius: 13,
                        offset: Offset(0, 3))
                  ],
                ),
                child: Icon(Icons.home, color: Theme.of(context).primaryColor),
              )
              */
              ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            title: Container(height: 0.0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Container(height: 0.0),
          ),
        ],
      );

  AppBar appBar() => AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.sort,
            color: Theme.of(context).hintColor,
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.currentTitle,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        actions: <Widget>[
          ShoppingCartButtonWidget(
            iconColor: Theme.of(context).hintColor,
            labelColor: Theme.of(context).accentColor,
          ),
          Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(top: 12.5, bottom: 12.5, right: horizon),
              child: InkWell(
                  onTap: () {
                    // Navigator.of(context).pushNamed('/Tabs', arguments: 1);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: imager(context, ''),
                  )
                  /*
                CircleAvatar(
                  backgroundImage: AssetImage('assets/imgs/AVATAR'),
                ),
                */
                  )),
        ],
      );
}

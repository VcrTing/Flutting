import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:example/screen/formula/formula.dart';
import 'package:example/screen/oprate/oprate.dart';
import 'package:example/screen/profile/profile.dart';
import 'package:example/screen/shop/shop.dart';
import 'package:flutter/material.dart';

import 'common/style.dart';
import 'screen/ask/ask.dart';

class MainTab extends StatefulWidget {
  int pageIndex;
  MainTab({this.pageIndex, Key key}) : super(key: key);

  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget screen;
  String title = '';
  int defIndex = 0;
  bool barNeed = true;

  List tabTitle = ['用户', '问卷', '操作', 'Formula', 'Shop'];

  // var _pageController = PageController(initialPage: 0);

  @override
  initState() {
    super.initState();
    defIndex = widget.pageIndex;
    print('defIndex = $defIndex');
    __tab(defIndex);
  }

  Color _showColor(int val) {
    return val == this.defIndex
        ? Theme.of(context).primaryColorDark
        : Theme.of(context).backgroundColor;
  }

  void __tab(int index) {
    switch (index) {
      case 0:
        this.screen = ProfileScreen();
        this.barNeed = false;
        break;
      case 1:
        this.screen = AskScreen();
        this.barNeed = true;
        break;
      case 2:
        this.screen = OperateScreen();
        this.barNeed = true;
        break;
      case 3:
        this.screen = FormulaScreen();
        this.barNeed = true;
        break;
      case 4:
        this.screen = ShopScreen();
        this.barNeed = true;
        break;
      default:
    }
  }

  _selectTab(int index) {
    if (index != this.defIndex)
      setState(() {
        this.title = tabTitle[index];
        this.defIndex = index;
        __tab(index);
      });
  }

  @override
  void didUpdateWidget(MainTab oldTab) {
    // 、、、_selectTab(widget.index);
    super.didUpdateWidget(oldTab);
  }

  Widget appBar() => AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          this.title,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.white),
        ),
        /*
        leading: new IconButton(
          icon: new Icon(Icons.close, color: Theme.of(context).backgroundColor),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        */
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: barNeed ? appBar() : null,
        body: this.screen
        /*PageView.builder(
            itemCount: tabTitle.length,
            onPageChanged: _selectTab,
            itemBuilder: (context, index) => this.screen) */
        , // this.screen,

        floatingActionButton: GestureDetector(
          onTap: () {
            this._selectTab(2);
          },
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: shadowColor,
                      offset: Offset(5, 5),
                      blurRadius: 3,
                      spreadRadius: -1.0)
                ],
                color: Theme.of(context).backgroundColor,
                border:
                    Border.all(color: Theme.of(context).primaryColor, width: 1),
                borderRadius: BorderRadius.circular(80)),
            child: Container(
              child: Icon(
                Icons.account_balance,
                size: 50,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectTab(0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.person,
                          color: this._showColor(0),
                        ),
                        Text(
                          this.tabTitle[0],
                          style: TextStyle(color: _showColor(0)),
                        )
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectTab(1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.terrain,
                          color: this._showColor(1),
                        ),
                        Text(
                          this.tabTitle[1],
                          style: TextStyle(color: _showColor(1)),
                        )
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectTab(2),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.work,
                            color: Theme.of(context)
                                .primaryColor // this._showColor(2),
                            ),
                        /*
                        Text(
                          this.tabTitle[2],
                          style: TextStyle(color: _showColor(2)),
                        )
                        */
                      ],
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectTab(3),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.table_chart,
                          color: this._showColor(3),
                        ),
                        Text(
                          this.tabTitle[3],
                          style: TextStyle(color: _showColor(3)),
                        )
                      ],
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectTab(4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: this._showColor(4),
                        ),
                        Text(
                          this.tabTitle[4],
                          style: TextStyle(color: _showColor(4)),
                        )
                      ],
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
        ));
  }
}

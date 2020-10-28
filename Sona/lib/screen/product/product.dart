import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/common/util/time.dart';
import 'package:sona/model/some/some.dart';
import 'package:sona/service/data.dart';
import 'package:sona/widget/bar.dart';
import 'package:sona/widget/imager.dart';
import 'package:sona/widget/product.dart';
import 'package:sona/widget/space.dart';
import 'package:sona/widget/title.dart';

import '../../tab.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with TickerProviderStateMixin {
  AnimationController _animateController;
  AnimationController _animationIcon;

  bool sortDef = true;

  @override
  void initState() {
    super.initState();
    _animationIcon = AnimationController(vsync: this)
          ..drive(Tween(begin: 0, end: 1))
          ..duration = Duration(milliseconds: 500)
        /*
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _animationIcon.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationIcon.forward();
        }
      })*/
        ;
  }

  @override
  void dispose() {
    super.dispose();
    _animationIcon.dispose();
  }

  Widget animatedIcon() => AnimatedIcon(
      color: Colors.white,
      size: iconM,
      icon: AnimatedIcons.menu_close,
      progress: _animationIcon);
  double topBarH = 80;

  Widget productEvery(Some some) => productWithSale(some);

  Widget productPanel() => FutureBuilder(
        future: loadSome(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Wrap(
              spacing: 0,
              runSpacing: 0,
              children: [
                ...snapshot.data.map((Some some) {
                  return InkWell(
                      child: productEvery(some),
                      onTap: () {
                        print('打开沙发页面');
                      });
                }).toList()
              ],
            );
          }
          return defContent();
        },
      );

  Widget content() => Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - topBarH,
        padding: EdgeInsets.symmetric(vertical: horizon),
        child: Container(
          child: productPanel(),
          padding: EdgeInsets.symmetric(horizontal: horizon / 2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        backgroundColor: Theme.of(context).buttonColor,
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [appBar(), content()],
            )));
  }

  Widget appBar() => Container(
        width: double.infinity,
        color: Theme.of(context).buttonColor,
        height: topBarH,
        alignment: Alignment.centerLeft,
        child: SafeArea(
          bottom: false,
          child: Row(
            children: [
              Expanded(flex: 3, child: backTxt()),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: horizonT),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          padding: EdgeInsets.only(bottom: distance),
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            child: Icon(
                              Icons.filter_list,
                              color: Colors.white,
                            ),
                            onTap: () {
                              print('过滤');
                            },
                          )),
                      sortMenu()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Widget backTxt() => backPanel(
      context,
      Icon(
        Icons.keyboard_arrow_left,
        // size: iconS,
        color: Colors.white,
      ),
      justTitle(context, 'Product', Colors.white));

  Widget sortMenu() => PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Container(
              child: Text(
                'Positive Sequence',
                style: TextStyle(
                    color: this.sortDef
                        ? Theme.of(context).buttonColor
                        : Theme.of(context).textTheme.bodyText1.color),
              ),
            ),
            value: true,
          ),
          PopupMenuItem(
            child: Container(
                child: Text('Reverse Sequence',
                    style: TextStyle(
                        color: this.sortDef
                            ? Theme.of(context).textTheme.bodyText1.color
                            : Theme.of(context).buttonColor))),
            value: false,
          )
        ],
        onSelected: (v) {
          setState(() {
            this.sortDef = v;
          });
        },
        elevation: 0,
        icon: Container(
          padding: EdgeInsets.symmetric(horizontal: horizonT),
          child: Icon(
            Icons.sort,
            color: Colors.white,
          ),
        ),
      );
}

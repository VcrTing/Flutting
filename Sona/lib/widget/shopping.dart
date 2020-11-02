import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/tab.dart';

class ShoppingCartButtonWidget extends StatelessWidget {
  const ShoppingCartButtonWidget({
    this.iconColor,
    this.labelColor,
    this.labelCount = 0,
    Key key,
  }) : super(key: key);

  final Color iconColor;
  final Color labelColor;
  final int labelCount;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Get.to(MainTab(
          currentTab: 1,
        ));
      },
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Icon(
              Icons.shopping_cart,
              color: this.iconColor,
              size: 28,
            ),
          ),
          Container(
            child: Text(
              this.labelCount.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption.merge(
                    TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 9),
                  ),
            ),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: this.labelColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            constraints: BoxConstraints(
                minWidth: 15, maxWidth: 15, minHeight: 15, maxHeight: 15),
          ),
        ],
      ),
      color: Colors.transparent,
    );
  }
}

Widget cartNumedOption(BuildContext context) => AspectRatio(
    aspectRatio: 16 / 4,
    child: Container(
      alignment: Alignment.bottomRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              print('ADD');
            },
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Theme.of(context).buttonTheme.colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(horizon)),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: iconS,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: horizon / 2),
            child: Text('2'),
          ),
          InkWell(
            onTap: () {
              print('Remove');
            },
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Theme.of(context).buttonTheme.colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(horizon)),
              child: Icon(
                Icons.remove,
                color: Colors.white,
                size: iconS,
              ),
            ),
          )
        ],
      ),
    ));

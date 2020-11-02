import 'package:flutter/material.dart';
import 'package:sona/common/style.dart';

class ProductAddToCartWidget extends StatefulWidget {
  ProductAddToCartWidget({Key key}) : super(key: key);

  @override
  _ProductAddToCartWidgetState createState() => _ProductAddToCartWidgetState();
}

class _ProductAddToCartWidgetState extends State<ProductAddToCartWidget> {
  int numed = 1;
  Widget productNumed() => Container(
      // color: Theme.of(context).scaffoldBackgroundColor,
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(left: horizon),
      child: PopupMenuButton(
          // initialValue: cart['numed'],
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          itemBuilder: (context) => [
                PopupMenuItem(
                  child: Padding(
                    child: Text(
                      '1',
                      style: TextStyle(
                          color: this.numed == 1
                              ? kTeal100
                              : Theme.of(context).textTheme.bodyText1.color),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: horizon),
                  ),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Padding(
                    child: Text(
                      '2',
                      style: TextStyle(
                          color: this.numed == 2
                              ? kTeal100
                              : Theme.of(context).textTheme.bodyText1.color),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: horizon),
                  ),
                  value: 2,
                ),
                PopupMenuItem(
                  child: Padding(
                    child: Text(
                      '3',
                      style: TextStyle(
                          color: this.numed == 3
                              ? kTeal100
                              : Theme.of(context).textTheme.bodyText1.color),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: horizon),
                  ),
                  value: 3,
                ),
              ],
          onSelected: (v) {
            print('选择了个数 $v');
            this.numed = v;
          },
          elevation: distance,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(distance),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(this.numed.toString()),
                    SizedBox(
                      width: horizonT,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: iconS,
                      // color: Colors.white,
                    ),
                  ],
                ),
              ))));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 12,
              child: RaisedButton(
                padding: EdgeInsets.symmetric(
                    horizontal: horizon, vertical: horizonT + 1),
                color: kTeal100,
                onPressed: () {
                  print('加入购物车');
                },
                child: Text(
                  'ADD TO CART',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: textS),
                ),
              )),
          Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.only(left: horizon),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 1)),
                // color: Theme.of(context).scaffoldBackgroundColor,
                // height: double.infinity,
                padding: EdgeInsets.symmetric(
                    horizontal: horizon, vertical: horizonT),
                child: productNumed(),
              ))
        ],
      ),
    );
  }
}

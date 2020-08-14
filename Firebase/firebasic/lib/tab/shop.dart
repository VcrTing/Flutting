import 'package:flutter/material.dart';
import 'package:firebasic/page/shop/shop_list.dart';

class Shop extends StatefulWidget {
  Shop({Key key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(245, 245, 245, 1),
      child: Column(
        children: <Widget>[ShopHeader(), ShopContent()],
      ),
    );
  }
}

class ShopHeader extends StatefulWidget {
  ShopHeader({Key key}) : super(key: key);

  @override
  _ShopHeaderState createState() => _ShopHeaderState();
}

class _ShopHeaderState extends State<ShopHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.cyan,
      padding: EdgeInsets.only(left: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '商品列表',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            flex: 2,
          ),
          Expanded(
              child: FlatButton.icon(
                onPressed: () {
                  print('新增');
                },
                icon: Icon(
                  Icons.plus_one,
                  color: Colors.white,
                ),
                label: Text(
                  '新增',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              flex: 1)
        ],
      ),
    );
  }
}

class ShopContent extends StatefulWidget {
  ShopContent({Key key}) : super(key: key);

  @override
  _ShopContentState createState() => _ShopContentState();
}

class _ShopContentState extends State<ShopContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: ShopList(),
    );
  }
}

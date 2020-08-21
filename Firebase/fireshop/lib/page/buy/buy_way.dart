import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fireshop/model/shop.dart';
import 'package:fireshop/model/user.dart';
import 'package:fireshop/model/pay.dart';
import 'package:fireshop/model/express.dart';
import 'package:fireshop/util/loading.dart';

import 'package:fireshop/pay/buyByPaypal.dart';

class BuyWay extends StatefulWidget {
  int buyCount;
  String productId;

  BuyWay({Key key, this.buyCount, this.productId}) : super(key: key);

  @override
  _BuyWayState createState() => _BuyWayState();
}

class _BuyWayState extends State<BuyWay> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Shop>.value(
        value: ShopModel().getOne(widget.productId),
        child: Scaffold(
            appBar: AppBar(
              title: Text('Pay Way'),
            ),
            body: Container(
                color: Color.fromRGBO(243, 243, 243, 1),
                child: BuyWayContent(
                  buyCount: widget.buyCount,
                ))));
  }
}

class BuyWayContent extends StatefulWidget {
  int buyCount;
  BuyWayContent({Key key, this.buyCount}) : super(key: key);

  @override
  _BuyWayContentState createState() => _BuyWayContentState();
}

class _BuyWayContentState extends State<BuyWayContent> {
  Shop shop;
  Pay pay;

  Widget zhiFuBao() {
    return Container(
      child: Row(
        children: [Text('支付宝'), Icon(Icons.arrow_right)],
      ),
    );
  }

  Widget payPal() {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => BuyByPaypal(pay: pay),
            ),
          );
        },
        child: Container(
          child: Row(
            children: [Text('Paypay'), Icon(Icons.arrow_right)],
          ),
        ));
  }

  Widget orderMsg() {
    return Container(
      padding: EdgeInsets.only(bottom: 25),
      child: Column(
        children: [
          Container(
            color: Colors.cyan,
            width: double.infinity,
            height: 170,
            child: Image.network(
              shop.avatar,
              fit: BoxFit.cover,
            ),
            margin: EdgeInsets.only(bottom: 5),
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  '${shop.name}',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Count: ${widget.buyCount}',
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Price: \$ ${(shop.price_result * widget.buyCount)}, or ¥ ${(shop.price_result * widget.buyCount * 6.9)}',
                  textAlign: TextAlign.left,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget main(String uid) {
    int shipping = 0;
    double totalAmount = (shop.price_result * widget.buyCount) + shipping;
    Express express = Express();
    express.basic('', uid, 'Eric', 'Nice', 'HongKong', 'JiuLong', '80008',
        'China', 'Asia', '+852 92779625');
    pay = Pay();
    pay.basic(
        '',
        uid,
        express,
        totalAmount,
        totalAmount,
        double.parse(shipping.toString()),
        widget.buyCount,
        shipping,
        shop.name,
        shop.price_result,
        '\$',
        Timestamp.now());

    return Column(children: [
      Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: orderMsg(),
      ),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.cyan),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Text(
          'Choise Main Payment',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          children: [zhiFuBao()],
        ),
      ),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.cyan),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Text(
          'Choise China Payment',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          children: [payPal()],
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    shop = Provider.of<Shop>(context) ?? null;
    User user = Provider.of<User>(context) ?? null;
    return shop == null ? Loading() : main(user.uid);
  }
}

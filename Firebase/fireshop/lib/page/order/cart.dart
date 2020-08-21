import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fireshop/model/buy.dart';

class CartPanel extends StatefulWidget {
  CartPanel({Key key}) : super(key: key);

  @override
  _CartPanelState createState() => _CartPanelState();
}

class _CartPanelState extends State<CartPanel> {
  List<Buy> buys = [
    Buy.fromJson({
      'id': 'id',
      'uid': 'uid',
      'productId': 'productId',
      'add_time': Timestamp.now(),
      'count': 2,
      'allPrice': 100.0,
      'avatar':
          'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=691906162,367291643&fm=26&gp=0.jpg',
      'name': '英国高品质马卡龙'
    }),
    Buy.fromJson({
      'id': 'id',
      'uid': 'uid',
      'productId': 'productId',
      'add_time': Timestamp.now(),
      'count': 1,
      'allPrice': 121.0,
      'avatar':
          'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1668660724,3411514757&fm=26&gp=0.jpg',
      'name': '意大利皇家质马卡龙 S级'
    }),
  ];
  Widget header() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Row(
        children: [
          Text(
            'Shopping Car',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          )
        ],
      ),
    );
  }

  List<Widget> carList() {
    return buys.map((buy) {
      return Container(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Color.fromRGBO(243, 243, 243, 1)))),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 15),
                color: Colors.cyan,
                width: 120,
                height: 75,
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        buy.name,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 18),
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      child: Icon(
                        Icons.chevron_right,
                        size: 24,
                      ),
                      flex: 1,
                    )
                  ],
                ),
              ),
              flex: 2,
            )
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          header(),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: carList(),
            ),
          )
          /*
          Scrollbar(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return oneCar(buys[index]);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
                itemCount: buys.length),
          )
          */
        ],
      ),
    );
  }
}

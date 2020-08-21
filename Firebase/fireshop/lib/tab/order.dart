import 'package:fireshop/model/car.dart';
import 'package:flutter/material.dart';
import 'package:fireshop/page/order/cart.dart';

class Order extends StatefulWidget {
  Order({Key key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [CarHeader()],
      ),
    );
  }
}

class CarHeader extends StatefulWidget {
  CarHeader({Key key}) : super(key: key);

  @override
  _CarHeaderState createState() => _CarHeaderState();
}

class _CarHeaderState extends State<CarHeader> {
  void _showCarPanel(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 900,
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: SingleChildScrollView(
              child: CartPanel(),
            ),
          );
        });
  }

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
              '已购订单',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            flex: 2,
          ),
          Expanded(
              child: FlatButton.icon(
                onPressed: () {
                  _showCarPanel(context);
                },
                icon: Icon(
                  Icons.looks,
                  color: Colors.white,
                ),
                label: Text(
                  '购物车',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              flex: 1)
        ],
      ),
    );
  }
}

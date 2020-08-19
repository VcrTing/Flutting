import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fireshop/model/shop.dart';
import 'package:fireshop/util/loading.dart';

class BuyWay extends StatefulWidget {
  int byCount;
  String productId;

  BuyWay({Key key, this.byCount, this.productId}) : super(key: key);

  @override
  _BuyWayState createState() => _BuyWayState();
}

class _BuyWayState extends State<BuyWay> {
  Shop shop;
  Map order;
  String avatar;
  double allPrice;
  String name;
  ShopModel shopApi = ShopModel();

  Widget zhiFuBao() {
    return Container(
      child: Row(
        children: [Text('支付宝'), Icon(Icons.arrow_right)],
      ),
    );
  }

  Widget payPal() {
    return Container(
      child: Row(
        children: [Text('Paypay'), Icon(Icons.arrow_right)],
      ),
    );
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
              order['avatar'],
              fit: BoxFit.cover,
            ),
            margin: EdgeInsets.only(bottom: 5),
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  '${order['name']}',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Count: ${order['buyCount']}',
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Price: \$ ${order['allPrice']} or ¥ ${(order['allPrice'] * 6.9)}',
                  textAlign: TextAlign.left,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void setOrder() async {
    setState(() {
      order = {
        'id': widget.productId,
        'name': shop.name,
        'allPrice': (shop.price_result * widget.byCount),
        'avatar': shop.avatar,
        'count_sale': shop.count_sale,
        'buyCount': widget.byCount
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    shopApi.getOne(widget.productId).listen((event) {
      shop = event;
    });
    setOrder();
    return order == null
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text('Pay Way'),
            ),
            body: Container(
              color: Color.fromRGBO(243, 243, 243, 1),
              child: Column(
                children: [
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      children: [payPal()],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

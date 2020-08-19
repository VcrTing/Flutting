import 'package:flutter/material.dart';
import '_detail.dart';
import 'package:fireshop/model/shop.dart';
import 'package:provider/provider.dart';
import 'package:fireshop/page/buy/buy_way.dart';

class ShopDetail extends StatefulWidget {
  final String productId;
  ShopDetail({Key key, this.productId}) : super(key: key);

  @override
  _ShopDetailState createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail> {
  bool loading = true;
  Shop shop;
  ShopModel shopApi = ShopModel();
  int buyCount = 1;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Shop>.value(
        value: shopApi.getOne(widget.productId),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Product Detail'),
          ),
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
            child: Column(
              children: [
                NextDetail(),
                SizedBox(
                  height: 5,
                ),
                buyCountShow(),
                SizedBox(
                  height: 25,
                ),
                buy(),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ));
  }

  Widget buyCountShow() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                print('减');
                setState(() {
                  buyCount--;
                  buyCount = buyCount < 1 ? 1 : buyCount;
                });
              },
              // child: Icon(Icons.chevron_left)),
              child: Icon(Icons.expand_more)),
          SizedBox(
            width: 5,
          ),
          Text('$buyCount'),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  print('加');
                  buyCount++;
                  buyCount = buyCount < 1 ? 1 : buyCount;
                });
              },
              // child: Icon(Icons.chevron_right)),
              child: Icon(Icons.expand_less)),
        ],
      ),
    );
  }

  Widget buy() {
    // widget.productId
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          RaisedButton(
            color: Colors.orange,
            onPressed: () {
              print('BUY');
            },
            child: Text(
              'Add to cart',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          RaisedButton(
            color: Colors.pink,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => BuyWay(
                            byCount: buyCount,
                            productId: widget.productId,
                          )));
            },
            child: Text(
              'Buy it now',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

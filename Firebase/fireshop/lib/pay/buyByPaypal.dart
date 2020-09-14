import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'paypal/PaypalPayment.dart';
import 'package:fireshop/util/loading.dart';

import 'package:fireshop/model/shop.dart';
import 'package:fireshop/model/user.dart';
import 'package:fireshop/model/pay.dart';
import 'package:fireshop/model/express.dart';

import 'package:provider/provider.dart';

class BuyByPaypal extends StatefulWidget {
  Pay pay;
  BuyByPaypal({Key key, this.pay}) : super(key: key);

  @override
  _BuyByPaypalState createState() => _BuyByPaypalState();
}

class _BuyByPaypalState extends State<BuyByPaypal> {
  Pay pay;

  Widget payMsg() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.fromLTRB(0, 20, 0, 25),
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 0.0), //阴影xy轴偏移量
                  blurRadius: 5.0, //阴影模糊程度
                  spreadRadius: 1.0 //阴影扩散程度
                  )
            ]),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Product:  ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                    '  ' + pay.itemName,
                    style: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.white),
                  ),
                  flex: 4,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Price:  ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text('  ' + pay.currency + ' ' + pay.itemPrice.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal)),
                      Text(' *' + pay.quantity.toString(),
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                  flex: 4,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Freight:  ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Text('  \$ ' + pay.shippingCost.toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal)),
                  flex: 4,
                )
              ],
            ),
          ),
        ]));
  }

  Widget addressMsg() {
    Express express = pay.express;
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 0.0), //阴影xy轴偏移量
                blurRadius: 5.0, //阴影模糊程度
                spreadRadius: 1.0 //阴影扩散程度
                )
          ]),
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.fromLTRB(0, 20, 0, 25),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Reciver:  ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                    '  ' + express.userFirstName + ' ' + express.userLastName,
                    style: TextStyle(color: Colors.white),
                  ),
                  flex: 4,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Tel Phone:  ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Text('  ' + pay.express.addressPhoneNumber,
                      style: TextStyle(color: Colors.white)),
                  flex: 4,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Address:  ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                      '  ' +
                          '${express.addressState} ${express.addressCountry} ${express.addressCity} ${express.addressStreet} [Code: ${express.addressZipCode}]',
                      style: TextStyle(color: Colors.white)),
                  flex: 4,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget totalPrice() {
    return Center(
        child: Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Total:   ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black54),
          ),
          Text(
            pay.currency +
                '' +
                ((pay.itemPrice * pay.quantity) +
                        pay.shippingCost +
                        pay.shippingDiscountCost)
                    .toString(),
            style: TextStyle(
                color: Colors.orange,
                fontSize: 28,
                fontWeight: FontWeight.w800),
          )
        ],
      ),
      width: double.infinity,
    ));
  }

  Widget header(text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(238, 238, 238, 1)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context) ?? null;
    pay = widget.pay;

    return Scaffold(
      appBar: AppBar(
        title: Text('Paypal'),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'Paypal Pay',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            SizedBox(
              height: 25,
            ),
            // header('Product'),
            payMsg(),
            SizedBox(
              height: 5,
            ),
            // header('Address'),
            addressMsg(),
            SizedBox(
              height: 45,
            ),
            totalPrice(),
            SizedBox(
              height: 5,
            ),
            Text('You will pay it by paypal. Are you sure.'),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              color: Colors.pink,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => PaypalPayment(
                      pay: pay,
                      onFinish: (number) async {
                        // payment done
                        print('order id: ' + number);
                      },
                    ),
                  ),
                );
              },
              child: Text(
                'Do it now',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}

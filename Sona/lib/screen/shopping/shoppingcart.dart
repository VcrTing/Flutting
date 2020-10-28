import 'package:flutter/material.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/service/data.dart';
import 'package:sona/widget/bar.dart';
import 'package:sona/widget/title.dart';

class ShoppingCartScreen extends StatefulWidget {
  ShoppingCartScreen({Key key}) : super(key: key);

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  GlobalKey cartKey = GlobalKey();
  double bottomH = 90;
  List cartList = [];
  int cartNumed = 0;

  Widget cartDef() => Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topCenter,
        padding:
            EdgeInsets.symmetric(horizontal: horizon, vertical: horizon * 6),
        child: Text(
          'There is nothing here.',
          style: TextStyle(fontSize: textL),
        ),
      );

  Widget productCart() => FutureBuilder(
        future: loadCart(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(children: [
              ...snapshot.data.map((e) {
                this.cartNumed += 1;
                return Container(child: Text('AAA'));
              }).toList()
            ]);
          }
          return cartDef();
        },
      );

  Widget content() => Container(
        width: double.infinity,
        color: Theme.of(context).scaffoldBackgroundColor,
        height: MediaQuery.of(context).size.height - bottomH - 175,
        child: productCart(),
      );

  Widget buttomBar() => Container(
        height: bottomH,
        // color: Theme.of(context).scaffoldBackgroundColor,
        padding:
            EdgeInsets.symmetric(horizontal: horizon, vertical: horizon / 2),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Price:',
                    style: TextStyle(fontSize: textS),
                  ),
                  SizedBox(
                    height: distance,
                  ),
                  Text(
                    '\$ 99999.99',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: textL),
                  )
                ],
              ),
              flex: 4,
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: RaisedButton(
                  color: Theme.of(context).buttonColor,
                  onPressed: () {},
                  child: Text(
                    'CHECKOUT',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [topBar(), content(), buttomBar()],
      ),
    );
  }

  Widget topBar() => Container(
      color: Theme.of(context).buttonColor,
      // padding: EdgeInsets.only(bottom: distance),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    cartOption(),
                    Container(
                      child: Text(
                        'CART',
                        style: TextStyle(fontSize: textM, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizon),
                      child: Text(''),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: CartNumedWidget(
                  cartNumed: cartNumed,
                  key: cartKey,
                ))
          ],
        ),
      ));
  Widget cartOption() => PopupMenuButton(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Row(
              children: [
                Icon(Icons.remove_shopping_cart),
                SizedBox(
                  width: horizon / 2,
                ),
                Text(
                  'CLEAR CART',
                )
              ],
            ),
            value: true,
          ),
        ],
        onSelected: (v) {
          print('清空购物车');
        },
        elevation: 0,
        icon: Container(
          padding: EdgeInsets.only(top: distance),
          child: Icon(
            Icons.keyboard_arrow_down,
            // size: iconS,
            color: Colors.white,
          ),
        ),
      );
}

class CartNumedWidget extends StatefulWidget {
  int cartNumed;
  CartNumedWidget({this.cartNumed, Key key}) : super(key: key);

  @override
  _CartNumedWidgetState createState() => _CartNumedWidgetState();
}

class _CartNumedWidgetState extends State<CartNumedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.symmetric(horizontal: horizon),
      child: Text(
        '${widget.cartNumed} items',
        style: Theme.of(context)
            .accentTextTheme
            .bodyText1
            .copyWith(color: Colors.white),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sona/common/style.dart';
import 'package:sona/widget/imager.dart';
import 'package:sona/widget/shopping.dart';
import 'package:sona/widget/title.dart';

class ShoppingCartEveryWidget extends StatelessWidget {
  ShoppingCartEveryWidget({this.cart, Key key}) : super(key: key);

  Map cart;

  Widget cartStatus(BuildContext context, bool status) => Container(
        decoration: BoxDecoration(
            color: status
                ? Colors.white
                : Theme.of(context).buttonTheme.colorScheme.onSecondary,
            border: Border.all(
                color: Theme.of(context).buttonTheme.colorScheme.onSecondary,
                width: 2,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(horizon * 2)),
        child: Icon(
          status ? Icons.remove : Icons.add,
          color: status
              ? Theme.of(context).buttonTheme.colorScheme.onSecondary
              : Colors.white,
          size: iconS,
        ),
      );

  Widget cartNumedOption(Map cart) => Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(left: horizon),
      child: PopupMenuButton(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          itemBuilder: (context) => [
                PopupMenuItem(
                  child: Padding(
                    child: Text(
                      '1',
                      style: TextStyle(
                          color: cart['numed'] == 1
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
                          color: cart['numed'] == 2
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
                          color: cart['numed'] == 3
                              ? kTeal100
                              : Theme.of(context).textTheme.bodyText1.color),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: horizon),
                  ),
                  value: 3,
                ),
              ],
          onSelected: (v) {
            cart['numed'] = v;
          },
          elevation: distance,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(distance),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(cart['numed'].toString()),
                    SizedBox(
                      width: horizonT,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: iconS,
                    ),
                  ],
                ),
              ))));

  Widget cartStatusPanel(BuildContext context) => InkWell(
      onTap: () {
        print('更改状态');
        cart['status'] = !cart['status'];
      },
      child: Padding(
          padding: EdgeInsets.only(right: horizon + horizon / 2),
          child: AspectRatio(
              aspectRatio: 1, child: cartStatus(context, cart['status']))));

  Widget productAvatarPanel(BuildContext context) => Container(
        child: AspectRatio(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(distance),
            child: imager(context, ''),
          ),
          aspectRatio: 1,
        ),
      );

  Widget productTitlePanel(BuildContext context) => Container(
        padding: EdgeInsets.only(left: horizon, top: horizonT / 2),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              customTitle(context, cart['product'].txt, null, textM),
              SizedBox(
                height: distance - 2,
              ),
              customTitle(context, 'price: ' + cart['product'].price,
                  Theme.of(context).accentColor, textS)
            ]),
      );

  Widget cartNumedPanel(BuildContext context) => Container(
        child: Row(
          children: [
            Expanded(
              child: SizedBox(height: distance),
              flex: 5,
            ),
            Expanded(
              child: AspectRatio(
                child: cartNumedOption(cart),
                aspectRatio: 21 / 9,
              ),
              flex: 2,
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.only(
          top: horizonT, right: horizon, left: horizon, bottom: horizon / 2),
      margin: EdgeInsets.only(bottom: 1),
      child: Row(
        children: [
          Expanded(flex: 1, child: cartStatusPanel(context)),
          Expanded(flex: 2, child: productAvatarPanel(context)),
          Expanded(
              flex: 5,
              child: Column(
                children: [
                  Align(
                    child: AspectRatio(
                        aspectRatio: 4 / 1, child: productTitlePanel(context)),
                    alignment: Alignment.topLeft,
                  ),
                  cartNumedPanel(context)
                ],
              ))
        ],
      ),
    );
  }
}

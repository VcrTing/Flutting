import 'package:flutter/material.dart';
import 'package:fireshop/model/shop.dart';
import 'package:provider/provider.dart';

import 'package:fireshop/page/shop/detail/detail.dart';

class ShopList extends StatefulWidget {
  ShopList({Key key}) : super(key: key);

  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Shop>>.value(
      value: ShopModel().shopsList,
      child: ShopListItem(),
    );
  }
}

class ShopListItem extends StatefulWidget {
  ShopListItem({Key key}) : super(key: key);

  @override
  _ShopListItemState createState() => _ShopListItemState();
}

class _ShopListItemState extends State<ShopListItem> {
  List<Shop> shops = [];
  List<Widget> everyShop(List<Shop> shops) {
    return shops.map((Shop shop) {
      // shop.defAdd();

      return Container(
        height: 260,
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          /*
          border: Border.all(
              width: 1, color: Colors.pink, style: BorderStyle.solid)),
              */
        ),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ShopDetail(productId: shop.id)));
              },
              child: Container(
                height: 170,
                color: Colors.cyan,
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: Image.network(
                    shop.avatar,
                    fit: BoxFit.cover,
                    height: 170,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              width: double.infinity,
              height: 90,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: <Widget>[
                  shop.selName(18),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        shop.selPrice(16, 1, true),
                        SizedBox(
                          width: 5,
                        ),
                        shop.selPriceOld(12, 1, false),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    shops = Provider.of<List<Shop>>(context) ?? [];
    /*
    return Column(
      children: <Widget>[everyShop(shops[0]), everyShop(shops[0])],
    );
    */
    return shops == null
        ? Container(
            margin: EdgeInsets.only(top: 60),
            child: Text('暂无商品！！！'),
          )
        : Container(
            child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: everyShop(shops),
            ),
          ));
  }
}

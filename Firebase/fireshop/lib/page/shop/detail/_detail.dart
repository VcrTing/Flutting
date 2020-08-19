import 'package:flutter/material.dart';
import 'package:fireshop/model/shop.dart';
import 'package:provider/provider.dart';
import 'package:fireshop/util/loading.dart';

class NextDetail extends StatefulWidget {
  NextDetail({Key key}) : super(key: key);

  @override
  _NextDetailState createState() => _NextDetailState();
}

class _NextDetailState extends State<NextDetail> {
  Widget avatarAlbum(String avatar, List<dynamic> imgs) {
    // imgs.insert(0, avatar);
    List<Widget> imgsCollect = [];
    imgs = imgs.length == 0 ? ['null', 'null', 'null'] : imgs;

    for (String img in imgs) {
      imgsCollect.add(Container(
        child: img == 'null'
            ? Container(
                constraints: BoxConstraints(minHeight: 56),
                color: Colors.cyan,
              )
            : Image.network(
                img,
                fit: BoxFit.cover,
              ),
      ));
      imgsCollect.add(Container(
        height: 1,
        color: Colors.white,
      ));
    }

    return Container(
        width: double.infinity,
        height: 170,
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: avatar == null
                    ? Loading()
                    : Image.network(
                        avatar,
                        fit: BoxFit.cover,
                      ),
              ),
              flex: 3,
            ),
            Expanded(
                child: Container(
                  height: 170,
                  padding: EdgeInsets.only(left: 2),
                  child: SingleChildScrollView(
                    child: Column(
                      children: imgsCollect,
                    ),
                    scrollDirection: Axis.vertical,
                  ),
                ),
                flex: 1)
          ],
        ));
  }

  Widget nameShow(String named) {
    return Container(
      width: double.infinity,
      child: Text(
        named,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  Widget contentShow(String contant) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              'Detail:',
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            contant,
            style: TextStyle(color: Colors.black45),
          )
        ],
      ),
    );
  }

  Widget priceShow(Shop shop) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Text('Price:'),
          SizedBox(
            width: 10,
          ),
          shop.selPrice(16, -1, true),
          SizedBox(
            width: 3,
          ),
          shop.selPriceOld(12, -1, false)
        ],
      ),
    );
  }

  Widget typedShow(String typed) {
    return Container(
      child: Row(
        children: [
          Text('Type:'),
          SizedBox(
            width: 10,
          ),
          Text(
            typed,
            style: TextStyle(color: Colors.black45),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shop = Provider.of<Shop>(context) ?? null;
    return shop == null
        ? Loading()
        : Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Column(
                  children: [
                    avatarAlbum(shop.avatar, shop.imgs),
                    SizedBox(
                      height: 30,
                    ),
                    nameShow(shop.name),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    priceShow(shop),
                    SizedBox(
                      height: 10,
                    ),
                    typedShow(shop.typed),
                    SizedBox(
                      height: 10,
                    ),
                    contentShow(shop.content),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          );
  }
}

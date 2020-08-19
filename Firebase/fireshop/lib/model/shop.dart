import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fireshop/service/index.dart';
import 'package:provider/provider.dart';

int ApiPageSize = 20;
String pricePrefix = '\$';
Color primary = Colors.cyan;
Color dark = Colors.black54;

class Shop {
  String id;
  String name;
  String content;

  double price_origin;
  double price_result;
  int count_inventory;
  int count_sale;

  Timestamp add_time;
  bool publish;
  String uid;
  String typed;

  String avatar;
  List<dynamic> imgs;
  /*
  Shop(
      {this.id,
      this.name,
      this.content,
      this.price_origin,
      this.price_result,
      this.count_inventory,
      this.count_sale,
      this.add_time,
      this.publish,
      this.avatar,
      this.imgs});
  */
  Shop();

  void basic(
      String uid,
      String name,
      String content,
      double price_origin,
      double price_result,
      int count_invertory,
      int count_sale,
      Timestamp add_time,
      bool publish,
      String typed,
      String avatar,
      List<dynamic> imgs) {
    this.add_time = add_time;
    this.avatar = avatar;
    this.content = content;
    this.count_inventory = count_invertory;
    this.count_sale = count_sale;
    this.imgs = imgs;
    this.name = name;
    this.price_origin = price_origin;
    this.price_result = price_result;
    this.publish = publish;
    this.typed = typed;
    this.uid = uid;

    if (add_time == null) {
      this.add_time = new Timestamp.now();
    }
    if (imgs == null || imgs == []) {
      this.imgs = [
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=691906162,367291643&fm=26&gp=0.jpg",
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1668660724,3411514757&fm=26&gp=0.jpg",
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2087316046,1444635935&fm=26&gp=0.jpg"
      ];
    }

    if (avatar == null || avatar == '') {
      this.avatar =
          'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3596238897,1831309151&fm=26&gp=0.jpg';
    }
  }

  Shop.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    name = parsedJson['name'];
    content = parsedJson['content'];
    price_origin = double.parse(parsedJson['price_origin'].toString());
    price_result = double.parse(parsedJson['price_result'].toString());
    count_inventory = int.parse(parsedJson['count_inventory'].toString());
    count_sale = int.parse(parsedJson['count_sale'].toString());
    add_time = parsedJson['add_time'];
    publish = parsedJson['publish'];
    avatar = parsedJson['avatar'];
    imgs = parsedJson['imgs'];
    uid = parsedJson['uid'];
    typed = parsedJson['typed'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'content': content,
      'price_origin': price_origin,
      'price_result': price_result,
      'count_inventory': count_inventory,
      'count_sale': count_sale,
      'add_time': add_time,
      'publish': publish,
      'avatar': avatar,
      'imgs': imgs,
      'uid': uid,
      'typed': typed
    };
  }

  void defAdd() {
    if (this.add_time == null) {
      this.add_time = new Timestamp.now();
    }
    if (this.imgs == null) {
      this.imgs = [
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=691906162,367291643&fm=26&gp=0.jpg",
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1668660724,3411514757&fm=26&gp=0.jpg",
        "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2087316046,1444635935&fm=26&gp=0.jpg"
      ];
    }

    if (this.avatar == null) {
      this.avatar =
          'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3596238897,1831309151&fm=26&gp=0.jpg';
    }

    // return shop;
  }

  Widget selName(double fs, [int ta = -1]) {
    TextAlign align = TextAlign.left;
    if (ta == 0) {
      align = TextAlign.center;
    } else if (ta == 1) {
      align = TextAlign.right;
    }
    return Text(
      name,
      style: TextStyle(fontSize: fs, fontWeight: FontWeight.bold, color: dark),
      textAlign: align,
    );
  }

  Widget selPrice(double fs, [int ta = -1, bool bold = false]) {
    TextAlign align = TextAlign.left;
    if (ta == 0) {
      align = TextAlign.center;
    } else if (ta == 1) {
      align = TextAlign.right;
    }
    return Text(
      pricePrefix + '${price_result.toString()}',
      style: TextStyle(
          color: Colors.orange,
          fontSize: fs,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal),
      textAlign: align,
    );
  }

  Widget selPriceOld(double fs, [int ta = -1, bool bold = false]) {
    TextAlign align = TextAlign.left;
    if (ta == 0) {
      align = TextAlign.center;
    } else if (ta == 1) {
      align = TextAlign.right;
    }
    return Text(
      pricePrefix + '${price_origin.toString()}',
      style: TextStyle(
          color: Colors.black45,
          fontStyle: FontStyle.italic,
          fontSize: fs,
          decoration: TextDecoration.lineThrough,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal),
      textAlign: align,
    );
  }
}

class ShopModel {
  final Services _service = Services();
  bool isFetching = false;
  String errMsg;
  bool isEnd;

  Stream<List<Shop>> get shopsList {
    try {
      Stream<List<Shop>> shops = _service.fetchShopsList();
      return shops;
    } catch (err, trace) {
      errMsg =
          "There is an issue with the app during request the data, please contact admin for fixing the issues " +
              err.toString();
      isFetching = false;
      print(trace.toString());
      // notifyListeners()

    }
    return null;
  }

  bool addOne(Shop shop) {
    print('---------- Model Add ----------');
    Map<String, dynamic> shopJson = shop.toJson();
    Future<DocumentReference> drf = _service.shopAddOne(shopJson);

    drf.then((value) {
      print('Value = value');
      /*
      value.snapshots().map((DocumentSnapshot doc) {
        Shop shop = Shop.fromJson(doc.data);
        print('Shop = ${shop}');
      });
      */
    });
    return true;
  }

  Stream<Shop> getOne(String docId) {
    return _service.getShopById(docId);
  }
}

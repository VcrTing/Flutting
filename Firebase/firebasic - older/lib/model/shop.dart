import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebasic/service/index.dart';
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

  Widget selPrice(double fs, [int ta = -1]) {
    TextAlign align = TextAlign.left;
    if (ta == 0) {
      align = TextAlign.center;
    } else if (ta == 1) {
      align = TextAlign.right;
    }
    return Text(
      pricePrefix + ' ${price_origin.toString()}',
      style: TextStyle(color: Colors.orange, fontSize: fs),
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
}

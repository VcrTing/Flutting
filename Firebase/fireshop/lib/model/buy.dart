import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fireshop/service/index.dart';
import 'package:provider/provider.dart';

class Buy {
  String id;
  String uid;
  String productId;
  Timestamp add_time;
  String orderId;
  int count;
  double price;

  Buy();

  void basic(String id, String uid, String productId, Timestamp add_time,
      String orderId, int count, double price) {
    this.id = id;
    this.uid = uid;
    this.productId = productId;
    this.add_time = add_time;
    this.orderId = orderId;
    this.count = count;
    this.price = price;
    if (add_time == null) {
      this.add_time = new Timestamp.now();
    }
  }

  Buy.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    uid = parsedJson['uid'];
    productId = parsedJson['productId'];
    add_time = parsedJson['add_time'];
    orderId = parsedJson['orderId'];
    count = parsedJson['count'];
    price = parsedJson['price'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'productId': productId,
      'add_time': add_time,
      'orderId': orderId,
      'count': count,
      'price': price
    };
  }
}

class BuyModel {}

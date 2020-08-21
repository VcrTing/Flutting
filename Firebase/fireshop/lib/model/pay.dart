import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './express.dart';

class Pay {
  String id;
  String uid;
  Express express;

  double totalAmount;
  double subTotalAmount;
  double shippingCost;
  int quantity;
  int shippingDiscountCost;

  String itemName;
  double itemPrice;
  String currency;

  Timestamp add_time;

  Pay();

  void basic(
      String id,
      String uid,
      Express express,
      double totalAmount,
      double subTotalAmount,
      double shippingCost,
      int quantity,
      int shippingDiscountCost,
      String itemName,
      double itemPrice,
      String currency,
      Timestamp add_time) {
    this.id = id;
    this.uid = uid;
    this.add_time = add_time;
    this.currency = currency;
    this.express = express;
    this.itemName = itemName;
    this.itemPrice = itemPrice;
    this.quantity = quantity;
    this.shippingCost = shippingCost;
    this.shippingDiscountCost = shippingDiscountCost;
    this.subTotalAmount = subTotalAmount;
    this.totalAmount = totalAmount;
  }

  Pay.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    uid = parsedJson['uid'];
    express = Express.fromJson(parsedJson['express']);
    totalAmount = double.parse(parsedJson['totalAmount']);
    subTotalAmount = double.parse(parsedJson['subTotalAmount']);
    shippingCost = double.parse(parsedJson['shippingCost']);
    quantity = int.parse(parsedJson['quantity']);
    shippingDiscountCost = int.parse(parsedJson['shippingDiscountCost']);
    itemName = parsedJson['itemName'];
    itemPrice = double.parse(parsedJson['itemPrice']);
    currency = parsedJson['currency'];
    add_time = parsedJson['add_time'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'express': express.toJson(),
      'totalAmount': totalAmount,
      'subTotalAmount': subTotalAmount,
      'shippingCost': shippingCost,
      'quantity': quantity,
      'shippingDiscountCost': shippingDiscountCost,
      'itemName': itemName,
      'itemPrice': itemPrice,
      'currency': currency,
      'add_time': add_time
    };
  }
}

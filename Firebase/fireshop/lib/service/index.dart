import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireshop/model/shop.dart';
import 'package:flutter/material.dart';

abstract class BaseSerivce {
  Stream<List<Shop>> fetchShopsList();
}

class Services implements BaseSerivce {
  final CollectionReference shopCollection =
      Firestore.instance.collection('firebase_shop');

  @override
  Stream<List<Shop>> fetchShopsList() {
    // TODO: implement fetchShopsList

    Stream<List<Shop>> shopsStream =
        shopCollection.snapshots().map((QuerySnapshot snapshot) {
      return snapshot.documents.map((doc) {
        return Shop.fromJson(doc.data);
      }).toList();
    });

    return shopsStream;
  }

  bool shopAddOne(Map<String, dynamic> rec) {
    print('Firebase Add');
    shopCollection.add(rec);

    return true;
  }
}

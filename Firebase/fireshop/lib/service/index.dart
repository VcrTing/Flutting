import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireshop/model/shop.dart';
import 'package:flutter/material.dart';

abstract class BaseSerivce {
  Stream<List<Shop>> fetchShopsList();
  Stream<Shop> getShopById(String docId);
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
        Shop shop = Shop.fromJson(doc.data);
        shop.id = doc.documentID;
        return shop;
      }).toList();
    });

    return shopsStream;
  }

  Future<DocumentReference> shopAddOne(Map<String, dynamic> rec) {
    return shopCollection.add(rec);
  }

  @override
  Stream<Shop> getShopById(String docId) {
    return shopCollection
        .document(docId)
        .snapshots()
        .map((DocumentSnapshot doc) {
      Shop shop = Shop.fromJson(doc.data);
      shop.id = doc.documentID;
      return shop;
    });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Category {
  String name;
  int way;

  bool status;
  Timestamp add_time;

  Category();

  Category.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['name'];
    way = parsedJson['way'];
    status = parsedJson['status'];
    add_time = parsedJson['add_time'];
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'way': way, 'status': status, 'add_time': add_time};
  }
}

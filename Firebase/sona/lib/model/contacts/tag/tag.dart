import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Tag {
  String name;

  bool status;
  Timestamp add_time;

  Tag();

  Tag.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['name'];
    status = parsedJson['status'];
    add_time = parsedJson['add_time'];
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'status': status, 'add_time': add_time};
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Abyss {
  String key;
  String scret;
  int way;
  String sender;
  String ak;
  String sk;

  bool status;
  Timestamp add_time;

  Abyss();

  Abyss.fromJson(Map<String, dynamic> parsedJson) {
    key = parsedJson['key'];
    scret = parsedJson['scret'];
    way = parsedJson['way'];
    sender = parsedJson['sender'];
    ak = parsedJson['ak'];
    sk = parsedJson['sk'];
    status = parsedJson['status'];
    add_time = parsedJson['add_time'];
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'scret': scret,
      'way': way,
      'sender': sender,
      'ak': ak,
      'sk': sk,
      'status': status,
      'add_time': add_time
    };
  }
}

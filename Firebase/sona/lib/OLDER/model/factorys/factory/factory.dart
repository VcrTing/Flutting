import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Factory {
  String key;
  String name;
  String name_en;
  String active_service;
  String live_up;
  String same;
  bool alive;

  bool status;
  Timestamp add_time;

  Factory();

  Factory.fromJson(Map<String, dynamic> parsedJson) {
    key = parsedJson['key'];
    name = parsedJson['name'];
    name_en = parsedJson['name_en'];
    active_service = parsedJson['active_service'];
    live_up = parsedJson['live_up'];
    same = parsedJson['same'];
    alive = parsedJson['alive'];
    status = parsedJson['status'];
    add_time = parsedJson['add_time'];
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'name': name,
      'name_en': name_en,
      'active_service': active_service,
      'live_up': live_up,
      'same': same,
      'alive': alive,
      'status': status,
      'add_time': add_time
    };
  }
}

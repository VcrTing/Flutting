import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Service {
  String name;
  int time_rule;
  int cycle;
  String category_id;

  bool status;
  Timestamp add_time;

  Service();

  Service.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['name'];
    time_rule = parsedJson['time_rule'];
    cycle = parsedJson['cycel'];
    category_id = parsedJson['category_id'];
    status = parsedJson['status'];
    add_time = parsedJson['add_time'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'time_rule': time_rule,
      'cycle': cycle,
      'category_id': category_id,
      'status': status,
      'add_time': add_time
    };
  }
}

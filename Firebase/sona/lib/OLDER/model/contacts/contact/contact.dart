import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Contact {
  String true_name;
  String country;
  String city;
  String addr;
  int gender;
  String birth;
  String tag_id;
  String group_id;

  bool status;
  Timestamp add_time;

  Contact();

  Contact.fromJson(Map<String, dynamic> parsedJson) {
    true_name = parsedJson['true_name'];
    country = parsedJson['country'];
    city = parsedJson['city'];
    addr = parsedJson['addr'];
    gender = parsedJson['gender'];
    birth = parsedJson['birth'];
    tag_id = parsedJson['tag_id'];
    group_id = parsedJson['group_id'];
    status = parsedJson['status'];
    add_time = parsedJson['add_time'];
  }

  Map<String, dynamic> toJson() {
    return {
      'true_name': true_name,
      'country': country,
      'city': city,
      'addr': addr,
      'gender': gender,
      'birth': birth,
      'tag_id': tag_id,
      'group_id': group_id,
      'status': status,
      'add_time': add_time
    };
  }
}

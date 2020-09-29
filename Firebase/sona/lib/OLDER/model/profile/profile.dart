import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Profile {
  String face;
  String banner;
  String name;
  String email;
  String password;
  int power;
  String factory_id;
  int wait_minute;

  bool status;
  Timestamp add_time;

  Profile();

  Profile.fromJson(Map<String, dynamic> parsedJson) {
    face = parsedJson['face'];
    banner = parsedJson['banner'];
    name = parsedJson['name'];
    email = parsedJson['email'];
    password = parsedJson['password'];
    power = parsedJson['power'];
    factory_id = parsedJson['factory_id'];
    wait_minute = parsedJson['wait_minute'];
  }

  Map<String, dynamic> toJson() {
    return {
      'face': face,
      'banner': banner,
      'name': name,
      'email': email,
      'password': password,
      'power': power,
      'factory_id': factory_id,
      'wait_minute': wait_minute,
      'status': status,
      'add_time': add_time
    };
  }
}

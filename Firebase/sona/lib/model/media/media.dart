import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Media {
  String file;
  String profile_id;

  bool status;
  Timestamp add_time;

  Media();

  Media.fromJson(Map<String, dynamic> parsedJson) {
    file = parsedJson['file'];
    profile_id = parsedJson['profile_id'];
    status = parsedJson['status'];
    add_time = parsedJson['add_time'];
  }

  Map<String, dynamic> toJson() {
    return {
      'file': file,
      'profile_id': profile_id,
      'status': status,
      'add_time': add_time
    };
  }
}

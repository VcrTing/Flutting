import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Email {
  String contact_id;
  String numm;
  String prefix;
  bool often;

  bool status;
  Timestamp add_time;

  Email();

  Email.fromJson(Map<String, dynamic> parsedJson) {
    contact_id = parsedJson['contact_id'];
    numm = parsedJson['numm'];
    prefix = parsedJson['prefix'];
    often = parsedJson['often'];
    status = parsedJson['status'];
    add_time = parsedJson['add_time'];
  }

  Map<String, dynamic> toJson() {
    return {
      'contact_id': contact_id,
      'numm': numm,
      'prefix': prefix,
      'often': often,
      'status': status,
      'add_time': add_time
    };
  }
}

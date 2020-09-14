import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Msg {
  String key;
  int way;
  String receive_num;
  String receive_prefix;
  String title;
  String content;
  String response_param;
  int success;
  int work_index;
  int repeat;
  Timestamp send_time;

  bool status;
  Timestamp add_time;

  Msg.fromJson(Map<String, dynamic> parsedJson) {
    key = parsedJson['key'];
    way = parsedJson['way'];
    receive_num = parsedJson['receive_num'];
    receive_prefix = parsedJson['receive_prefix'];
    title = parsedJson['title'];
    content = parsedJson['content'];
    response_param = parsedJson['response_param'];
    success = parsedJson['success'];
    work_index = parsedJson['work_index'];
    repeat = parsedJson['repeat'];
    send_time = parsedJson['send_time'];

    status = parsedJson['status'];
    add_time = parsedJson['add_time'];
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'way': way,
      'receive_num': receive_num,
      'receive_prefix': receive_prefix,
      'title': title,
      'content': content,
      'response_param': response_param,
      'success': success,
      'work_index': work_index,
      'repeat': repeat,
      'send_time': send_time,
      'status': status,
      'add_time': add_time
    };
  }
}

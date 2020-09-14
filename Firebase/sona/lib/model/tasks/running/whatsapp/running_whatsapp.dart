import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RunningWhatsApp {
  String task_apply_id;
  double cost;

  int time_rule_now;
  int background_index_now;

  Timestamp send_time;
  bool send_status;
  bool perform;
  bool lock;
  bool success;

  String task_param;
  String result_response;
  String receive_name;
  String receive_numm;
  String receive_title;
  String receive_content;
  String receive_response_param;

  bool status;
  Timestamp add_time;

  RunningWhatsApp();

  RunningWhatsApp.fromJson(Map<String, dynamic> parseJson) {
    task_apply_id = parseJson['task_apply_id'];
    cost = parseJson['cost'];
    time_rule_now = parseJson['time_rule_now'];
    background_index_now = parseJson['background_index_now'];
    send_time = parseJson['send_time'];
    send_status = parseJson['send_status'];
    perform = parseJson['perform'];
    lock = parseJson['lock'];
    success = parseJson['success'];
    task_param = parseJson['task_param'];
    result_response = parseJson['result_response'];
    receive_name = parseJson['receive_name'];
    receive_numm = parseJson['receive_numm'];
    receive_title = parseJson['receive_title'];
    receive_content = parseJson['receive_content'];
    receive_response_param = parseJson['receive_response_param'];

    status = parseJson['status'];
    add_time = parseJson['add_time'];
  }

  Map<String, dynamic> toJson() {
    return {
      'task_apply_id': task_apply_id,
      'cost': cost,
      'time_rule_now': time_rule_now,
      'background_index_now': background_index_now,
      'send_time': send_time,
      'send_status': send_status,
      'perform': perform,
      'lock': lock,
      'success': success,
      'task_param': task_param,
      'result_response': result_response,
      'receive_name': receive_name,
      'receive_numm': receive_numm,
      'receive_title': receive_title,
      'receive_content': receive_content,
      'receive_response_param': receive_response_param,
      'status': status,
      'add_time': add_time
    };
  }
}

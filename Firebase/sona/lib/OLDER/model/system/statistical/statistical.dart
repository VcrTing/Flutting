import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Statistical {
  String profile_id;
  int task_apply_count;
  int task_runnning_count;
  double total_cost;
  int way;

  bool status;
  Timestamp add_time;

  Statistical();

  Statistical.fromJson(Map<String, dynamic> parsedJson) {
    profile_id = parsedJson['profile_id'];
    task_apply_count = parsedJson['task_apply_count'];
    task_runnning_count = parsedJson['task_running_count'];
    total_cost = parsedJson['total_cost'];
    way = parsedJson['way'];

    status = parsedJson['status'];
    add_time = parsedJson['add_time'];
  }

  Map<String, dynamic> toJson() {
    return {
      'profile_id': profile_id,
      'task_apply_count': task_apply_count,
      'task_runnning_count': task_runnning_count,
      'total_cost': total_cost,
      'way': way,
      'status': status,
      'add_time': add_time
    };
  }
}

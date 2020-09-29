import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskApply {
  String service_id;
  String template_id;
  String profile_id;
  String contact_id;

  int work_time_rule;
  int work_cycle;
  int work_first;

  int background_index;
  int send_index;
  int way;

  String visit_time;
  Timestamp next_time;

  bool apply_status;
  bool serial_status;
  bool over_status;

  bool status;
  Timestamp add_time;

  TaskApply();

  TaskApply.fromJson(Map<String, dynamic> parseJson) {
    service_id = parseJson['service_id'];
    template_id = parseJson['template_id'];
    profile_id = parseJson['profile_id'];
    contact_id = parseJson['contact_id'];

    work_time_rule = parseJson['work_time_rule'];
    work_cycle = parseJson['work_cycle'];
    work_first = parseJson['work_first'];

    background_index = parseJson['background_index'];
    send_index = parseJson['send_index'];
    way = parseJson['way'];

    visit_time = parseJson['visit_time'];
    next_time = parseJson['next_time'];

    apply_status = parseJson['apply_status'];
    serial_status = parseJson['serial_status'];
    over_status = parseJson['over_status'];

    status = parseJson['status'];
    add_time = parseJson['add_time'];
  }

  Map<String, dynamic> toJson() {
    return {
      'service_id': service_id,
      'template_id': template_id,
      'profile_id': profile_id,
      'contact_id': contact_id,
      'work_time_rule': work_time_rule,
      'work_cycle': work_cycle,
      'work_first': work_first,
      'background_index': background_index,
      'send_index': send_index,
      'way': way,
      'visit_time': visit_time,
      'next_time': next_time,
      'apply_status': apply_status,
      'serial_status': serial_status,
      'over_status': over_status,
      'status': status,
      'add_time': add_time
    };
  }
}

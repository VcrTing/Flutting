import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TemplateEmail {
  String lang;
  String first_title;
  String first_content;
  String title;
  String content;
  String response_param;
  String service_id;

  bool status;
  Timestamp add_time;

  TemplateEmail();

  TemplateEmail.fromJson(Map<String, dynamic> parsedJson) {
    lang = parsedJson['lang'];
    first_title = parsedJson['first_title'];
    first_content = parsedJson['first_content'];
    title = parsedJson['title'];
    content = parsedJson['content'];
    response_param = parsedJson['response_param'];
    service_id = parsedJson['service_id'];
    status = parsedJson['status'];
    add_time = parsedJson['add_time'];
  }

  Map<String, dynamic> toJson() {
    return {
      'lang': lang,
      'first_title': first_title,
      'first_content': first_content,
      'title': title,
      'content': content,
      'response_param': response_param,
      'service_id': service_id,
      'status': status,
      'add_time': add_time
    };
  }
}

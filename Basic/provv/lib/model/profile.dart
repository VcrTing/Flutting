import 'package:flutter/material.dart';

class Profile {
  String id;
  String account;
  String name;
  String password;
  String money;

  Profile();

  Profile.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    account = parsedJson['account'];
    name = parsedJson['name'];
    password = parsedJson['password'];
    money = parsedJson['money'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'account': account,
      'name': name,
      'password': password,
      'money': money
    };
  }
}

import 'package:flutter/material.dart';

class Profile {
  String id;
  String account;
  String name;
  String password;
  String money;
  String avatar;
  String background;
  int gender;

  Profile();

  Profile.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    account = parsedJson['account'];
    name = parsedJson['name'];
    password = parsedJson['password'];
    money = parsedJson['money'];
    gender = int.parse(parsedJson['gender'].toString());
    avatar = parsedJson['avatar'];
    background = parsedJson['background'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'account': account,
      'name': name,
      'password': password,
      'money': money,
      'avatar': avatar,
      'gender': gender,
      'background': background
    };
  }
}

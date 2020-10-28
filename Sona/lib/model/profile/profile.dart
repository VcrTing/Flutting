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
  String loginTime;

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
    loginTime = parsedJson['loginTime'];
  }

  void def() {
    this.gender = 0;
    this.money = '99';
    this.name = 'VcrTing';
    this.account = '13576639986';
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
      'background': background,
      'loginTime': loginTime
    };
  }
}

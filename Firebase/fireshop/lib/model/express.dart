import 'package:flutter/material.dart';

class Express {
  String id;
  String uid;
  String userFirstName;
  String userLastName;
  String addressCity;
  String addressStreet;
  String addressZipCode;
  String addressCountry;
  String addressState;
  String addressPhoneNumber;

  Express();

  void basic(
    String id,
    String uid,
    String userFirstName,
    String userLastName,
    String addressCity,
    String addressStreet,
    String addressZipCode,
    String addressCountry,
    String addressState,
    String addressPhoneNumber,
  ) {
    this.id = id;
    this.uid = uid;
    this.userFirstName = userFirstName;
    this.userLastName = userLastName;
    this.addressCity = addressCity;
    this.addressCountry = addressCountry;
    this.addressPhoneNumber = addressPhoneNumber;
    this.addressState = addressState;
    this.addressStreet = addressStreet;
    this.addressZipCode = addressZipCode;
  }

  Express.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    uid = parsedJson['uid'];
    userFirstName = parsedJson['userFirstName'];
    userLastName = parsedJson['userLastName'];
    addressCity = parsedJson['addressCity'];
    addressStreet = parsedJson['addressStreet'];
    addressZipCode = parsedJson['addressZipCode'];
    addressCountry = parsedJson['addressCountry'];
    addressState = parsedJson['addressState'];
    addressPhoneNumber = parsedJson['addressPhoneNumber'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'userFirstName': userFirstName,
      'userLastName': userLastName,
      'addressCity': addressCity,
      'addressStreet': addressStreet,
      'addressZipCode': addressZipCode,
      'addressCountry': addressCountry,
      'addressState': addressState,
      'addressPhoneNumber': addressPhoneNumber
    };
  }
}

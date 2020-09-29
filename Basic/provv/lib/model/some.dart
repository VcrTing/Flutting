import 'package:cloud_firestore/cloud_firestore.dart';

class Some {
  String id;

  String txt;
  String price;

  bool status;
  Timestamp add_time;

  Some();

  Some.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.txt = parsedJson['txt'];
    this.price = parsedJson['price'];
    this.add_time = parsedJson['add_time'];
    this.status = parsedJson['status'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'txt': txt,
      'price': price,
      'status': status,
      'add_time': add_time
    };
  }
}

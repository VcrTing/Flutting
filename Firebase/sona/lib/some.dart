import 'package:cloud_firestore/cloud_firestore.dart';

class Some {
  String txt;
  String price;
  Timestamp add_time;

  Some();

  Some.fromJson(Map<String, dynamic> parsedJson) {
    this.txt = parsedJson['txt'];
    this.price = parsedJson['price'];
    this.add_time = parsedJson['add_time'];
  }

  Map<String, dynamic> toJson() {
    return {'txt': txt, 'price': price, 'add_time': add_time};
  }
}

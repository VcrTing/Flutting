import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sona/model/some/gategory/gategory.dart';

class SomeImg {
  String id;
  List<String> imgs;
  SomeImg();
  SomeImg.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];

    List<String> srcs = [];
    if (parsedJson["imgs"] != null && parsedJson["imgs"].length > 0) {
      for (var item in parsedJson["imgs"]) {
        srcs.add(item);
      }
    }
    this.imgs = srcs;
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'imgs': imgs};
  }
}

class Some {
  String id;

  String txt;
  String price;

  bool status;
  Timestamp add_time;

  String avatar;
  SomeImg some_img;

  Gategory gategory;

  Some();

  Some.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.txt = parsedJson['txt'];
    this.price = parsedJson['price'];
    this.add_time = parsedJson['add_time'];
    this.status = parsedJson['status'];
    this.avatar = parsedJson['avatar'];
    this.gategory = Gategory.fromJson(parsedJson['gategory']);
    this.some_img = SomeImg.fromJson(parsedJson['some_img']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'txt': txt,
      'price': price,
      'status': status,
      'avatar': avatar,
      'add_time': add_time,
      'gategory': gategory.id, // 使用 id 储存
      'some_img': some_img.toJson()
    };
  }
}

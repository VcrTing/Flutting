import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../some.dart';

class SomeModel with ChangeNotifier {
  String txt;

  List<Some> someList = [];

  SomeModel() {
    this.txt = '';
  }

  void loadTxt() {
    this.txt = 'This is from Txt';
    notifyListeners();
  }

  void initSome() {
    this.someList.add(Some.fromJson({
          'txt': 'This is Static Txt',
          'price': '20',
          'add_time': Timestamp.now()
        }));
  }

  Future<List<Some>> loadThing() {
    initSome();
    return Future.delayed(Duration(seconds: 2), () {
      return this.someList;
    });
  }

  void getThing() {
    this.someList = [];
    this.someList.add(Some.fromJson({
          'txt': 'This is Static Txt',
          'price': '20',
          'add_time': Timestamp.now()
        }));
    notifyListeners();
  }

  void getThingInFuture() async {
    await Future.delayed(Duration(seconds: 3), () {
      getThing();
    });
  }

  // 从 Firebase 中获取数据
  void getSomeListFromFirebase() async {
    await FirebaseFirestore.instance.collection('some').get().then((value) {
      this.someList = [];
      value.docs.forEach((element) {
        this.someList.add(Some.fromJson(element.data()));
      });
      notifyListeners();
    });
  }
}

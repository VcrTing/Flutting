import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provv/model/some.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class SomeModel with ChangeNotifier {
  List<Some> someList = [];
  List<Some> someTrash = [];

  Some some;

  CollectionReference someRef = FirebaseFirestore.instance.collection('some');

  SomeModel();

  // 获取 Some 列表
  void getSomeFromFirebase() async {
    await Future.delayed(Duration(seconds: 2), () {
      someRef.where('status', isEqualTo: true).get().then((value) {
        someList.clear();
        value.docs.forEach((element) {
          if (element.exists) {
            Some some = Some.fromJson(element.data());
            some.id = element.id;
            someList.add(some);
          }
        });
        notifyListeners();
      });
    });
  }

  // 获取 已删除 的列表
  void getSomeTrashFromFirebase() async {
    await Future.delayed(Duration(seconds: 2), () {
      someRef.where('status', isEqualTo: false).get().then((value) {
        someTrash.clear();
        value.docs.forEach((element) {
          if (element.exists) {
            Some some = Some.fromJson(element.data());
            some.id = element.id;
            someTrash.add(some);
          }
        });
        notifyListeners();
      });
    });
  }

  // 更新 某个 Some
  void updSomeInFirebase(Some some) async {
    await someRef
        .doc(some.id)
        .update(some.toJson())
        .then((value) => getSomeFromFirebase());
  }

  // 删除 某个 Some
  void delSomeInFirebase(String id) async {
    await someRef
        .doc(id)
        .update({'status': false}).then((value) => getSomeFromFirebase());
  }

  // 恢复 某个 Some
  void backSomeInFirebase(String id) async {
    await someRef
        .doc(id)
        .update({'status': true}).then((value) => getSomeTrashFromFirebase());
  }

  // 获取单个 Some
  Future<Some> getSomeOneInFirebase(String id) async {
    // Future<void> getSomeOneInFirebase(String id) async {
    // await someRef.doc(id).get().then((value) => Some.fromJson(value.data()));
    //
    print('进入获取 Some One 的 后台');
    return await Future.delayed(Duration(seconds: 2), () {
      Some _some;
      someList.forEach((element) {
        if (element.id == id) {
          _some = element;
        }
      });
      return _some;
    });
  }

  // 修改单个 Some
  void updSomeOneInFirebase(Some some) async {
    // 使用 本Model 内的 Some
    someRef
        .doc(some.id)
        .update(some.toJson())
        .then((value) => print('修改成功！！！'));
  }
}

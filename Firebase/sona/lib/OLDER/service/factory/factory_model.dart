import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'factory_instance.dart';

Map<String, dynamic> defFac = {
  'key': 'eye',
  'name': '眼镜中心',
  'name_en': 'Eye',
  'activte_service': 'email',
  'live_up': '',
  'same': '',
  'alive': false
};

List profiles = [
  {
    'name': 'VcrTing',
    'face':
        'https://i2.hdslb.com/bfs/face/0104ab71811ff50cb80e4916d9b83eb404957b62.jpg@140w_140h_1c_100q.webp',
    'banner':
        'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=185678294,3886857132&fm=26&gp=0.jpg'
  }
];

bool lock = false;

class FactoryModel with ChangeNotifier {
  // FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
  // FirebaseFirestore firestore = FirebaseFirestore.instanceFor(app: secondaryApp);
  CollectionReference factoryInstance =
      FirebaseFirestore.instance.collection('factory');

  Factory fac;
  bool loading;
  String asyncTxt;

  FactoryModel() {
    this.loading = true;
    this.asyncTxt = 'Init';
  }

  Future<String> getFuture() {
    print('获取Future 数据');
    return Future.delayed(Duration(seconds: 5), () {
      // return Factory.fromJson(defFac);
      return 'This is in Future.';
    });
  }

  void getAsync() {
    if (!lock) {
      Future.delayed(Duration(seconds: 5), () {
        print('Async 执行');
        this.asyncTxt = 'This is in Async.';
        notifyListeners();
        lock = true;
      });
    } else {
      print('被锁');
    }
  }

  Future<Factory> getFactoryFromFirebase() {
    print('开始获取数据');
    return factoryInstance.doc('eye').get().then((value) {
      print('已经获取到了数据');
      return Factory.fromJson(value.data());
    });
  }

  void updateFactoryFirebase(Factory newFire) {
    print('START UPDATE :${newFire.name}');

    factoryInstance
        .doc('eye')
        .update(newFire.toJson())
        .then((value) => print('Fac Updated'))
        .catchError((error) => print('Failed to update Fac: $error'));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/profile.dart';

import '../widget/local.dart';

class UserModel with ChangeNotifier {
  Profile profile;

  bool isLogin;
  bool autoLogin;

  UserModel() {
    autoLogin = true;
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference profRef =
      FirebaseFirestore.instance.collection('profile');

  void changeAutoLogin(bool f) {
    this.autoLogin = f;
    notifyListeners();
  }

  void changeIsLogin(bool f) {
    this.isLogin = f;
    notifyListeners();
  }

  void changeProfile(Profile prof) {
    this.profile = prof;
    notifyListeners();
  }

  // 获取用户 by Shared
  Future<Profile> getProfileInShared() async {
    return await sharedGet('profile').then((value) {
      print('Shared Value = $value');
      return value == null ? null : Profile.fromJson(value);
    });
  }

  // 获取用户 by Firebase
  Future<Profile> getProfileInFirebase(String uid) async {
    return await profRef.doc(uid).get().then((value) {
      print('Firebase User Data = ${value.data()}');
      return Profile.fromJson(value.data());
    });
  }

  // 获取 Uid
  Future<String> getUidByEmail(Profile prof) async {
    String uid;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: prof.account, password: prof.password);
      uid = userCredential.user.uid;
      print('Uid = $uid');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-fount') {
      } else if (e.code == 'wrong-password') {}
    }
    return uid;
  }

  // 处理登录之后
  void dealLogin(Profile prof) {
    changeProfile(prof);
    changeIsLogin(true);
    changeAutoLogin(true);
    sharedSave('profile', prof.toJson());
  }

  // 用户登录 by Account
  void login(Profile prof) async {
    /*
    getProfileInShared().then((value) {
      
      if (value == null) {}
    });
    */
    // 使用电邮密码获取用户
    getUidByEmail(prof).then((value) {
      if (value != null) {
        getProfileInFirebase(value).then((value) {
          if (value != null) {
            dealLogin(value);
          }
        });
      }
    });
  }

  // 用户登录 by Uid
  void loginByUid(String uid) async {
    getProfileInFirebase(uid).then((value) {
      if (value != null) {
        dealLogin(value);
      }
    });
  }

  // 切换 用户
  void loginOut(Profile prof) async {
    changeProfile(null);
    changeIsLogin(false);
    changeAutoLogin(false);
    // sharedRemove('profile');
  }
}

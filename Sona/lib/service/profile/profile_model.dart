import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sona/model/profile/profile.dart';

class ProfileModel with ChangeNotifier {
  Profile profile;

  bool isLogin;
  bool autoLogin;

  ProfileModel() {
    autoLogin = true;
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference fireRef =
      FirebaseFirestore.instance.collection('profile');

  void changeLogin(res) {
    isLogin = res;
    notifyListeners();
  }

  void changeLoginAuto(res) {
    autoLogin = res;
    notifyListeners();
  }
}

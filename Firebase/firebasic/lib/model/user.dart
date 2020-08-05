import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class User {
  final String uid;
  String named;
  int age;

  User({this.uid, this.named, this.age});
}

class UserModel {
  final String uid;
  UserModel({this.uid});

  bool islogin = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CollectionReference userCollection =
      Firestore.instance.collection('firebasic_user');

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, named: '', age: 0) : null;
  }

  // 匿名用户登录
  Future siginInAnon() async {
    try {
      print('Login with Anon');
      AuthResult res = await _auth.signInAnonymously();
      FirebaseUser user = res.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print('Sign Error = ${e.toString()}');
      return null;
    }
  }

  // Sigin Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // 新增资料
  Future submitContact(String named, int age) async {
    // _user.named = named;
    // _user.age = age;
    print('执行 SetData');
    print('Uid = ${uid}');
    return await userCollection
        .document(uid)
        .setData({'named': named, 'age': age});
  }
}

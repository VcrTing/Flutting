import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class User {
  final String uid;
  String named;
  int age;
  String email;

  User({this.uid, this.named, this.age, this.email});
}

class UserModel {
  final String uid;
  UserModel({this.uid});

  bool islogin = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 手机验证 参数
  int code;
  String verificationId;
  AuthCredential phoneAuthCredential;

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

  // 用账号密码登录
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print('Sign Error = ${e.toString()}');
      return null;
    }
  }

  // 用账号密码注册
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  // 手机号码注册
  Future<List> submitPhoneNumber(String prefix, String phone) async {
    String phoneNumber = prefix + ' ' + phone;
    print('需验证的电话号码为 = ${phoneNumber}');

    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(microseconds: 10000),
        verificationCompleted: (AuthCredential phoneAuth) {
          phoneAuthCredential = phoneAuth;
        },
        verificationFailed: (AuthException error) {
          print('Error = ${error}');
        },
        codeSent: (String verificationId, [int code]) {
          verificationId = verificationId;
          code = code;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('手机验证超时');
          print('当前 verificationId = ${verificationId}');
        });
    print('verificationId = ${verificationId}');
    print('phoneAuthCredential = ${phoneAuthCredential}');
    print('code = ${code}');
    return [code, verificationId];
  }

  // 手机号码登录
  Future login(AuthCredential credential) async {
    try {
      print('进行 Login');
      AuthResult result =
          await FirebaseAuth.instance.signInWithCredential(credential);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  Future submitOTP(String smsCode, String verificationId) async {
    AuthCredential phoneCredential = PhoneAuthProvider.getCredential(
        verificationId: verificationId, smsCode: smsCode);
    print('submitOTP = ${phoneCredential}');
    return await login(phoneCredential);
  }

  // Sigin Out
  Future signOut() async {
    try {
      print('退出登录');
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // 新增资料
  Future submitContact(String named, int age, String email) async {
    // _user.named = named;
    // _user.age = age;
    print('执行 SetData');
    print('Uid = ${uid}');
    return await userCollection
        .document(uid)
        .setData({'named': named, 'age': age, 'email': email});
  }
}

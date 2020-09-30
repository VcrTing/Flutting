import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sona/model/some/some.dart';

class SomeModel with ChangeNotifier {
  List<Some> someList = [];

  Some some;

  CollectionReference fireRef = FirebaseFirestore.instance.collection('some');

  SomeModel();
}

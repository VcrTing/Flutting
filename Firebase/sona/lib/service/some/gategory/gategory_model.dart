import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sona/model/some/gategory/gategory.dart';
import 'package:sona/model/some/some.dart';

class GategoryModel with ChangeNotifier {
  List<Gategory> gategoryList = [];

  CollectionReference fireRef =
      FirebaseFirestore.instance.collection('gategory');

  GategoryModel();
}

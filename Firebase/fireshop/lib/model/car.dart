import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fireshop/service/index.dart';
import 'package:provider/provider.dart';

import 'buy.dart';

class Car {
  String uid;
  List<Buy> buys;
}

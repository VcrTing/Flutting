import 'package:cloud_firestore/cloud_firestore.dart';

String timestampFmt(Timestamp t, [cn = false, short = true]) {
  DateTime e = t.toDate();

  String res =
      e.year.toString() + '-' + e.month.toString() + '-' + e.day.toString();
  return short
      ? res
      : res + ' ' + e.hour.toString() + ':' + e.minute.toString();
}

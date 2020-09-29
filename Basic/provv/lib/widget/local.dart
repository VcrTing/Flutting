import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

sharedSave(k, v, [typed = 'String']) async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  switch (typed) {
    case 'String':
      String vJson = json.encode(v);
      sharedPref.setString(k, vJson);
      break;
    case 'Bool':
      sharedPref.setBool(k, v);
      break;
    case 'Double':
      sharedPref.setDouble(k, v);
      break;
    default:
      sharedPref.setInt(k, v);
  }
}

Future<dynamic> sharedGet(k, [typed = 'String']) async {
  dynamic res;
  SharedPreferences sharedPref = await SharedPreferences.getInstance();

  switch (typed) {
    case 'String':
      String rec = sharedPref.getString(k);
      if (rec != null && rec.length > 0) {
        res = jsonDecode(rec);
      }
      break;
    case 'Bool':
      res = sharedPref.getBool(k);
      break;
    case 'Double':
      res = sharedPref.getDouble(k);
      break;
    default:
      res = sharedPref.getInt(k);
  }
  return res;
}

sharedRemove(String k) async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  sharedPref.remove(k);
}

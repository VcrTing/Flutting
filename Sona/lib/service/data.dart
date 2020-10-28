import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sona/model/profile/profile.dart';
import 'package:sona/model/some/some.dart';

/* 产品 */
Future<List<Some>> loadSome() async => _someList();

List<Some> _someList() => [
      Some.fromJson({
        'id': 'Axxiu09909L',
        'txt': 'Beauty of Bed',
        'price': '799',
        'status': true,
        'avatar': '',
        'add_time': Timestamp.fromDate(new DateTime.now()),
        'gategory': {'id': '10', 'named': 'sofa'},
        'some_img': {'id': '100', 'imgs': []}
      }),
      Some.fromJson({
        'id': 'Axxiu09909L',
        'txt': 'Beauty of Sofa',
        'price': '199',
        'status': true,
        'avatar': '',
        'add_time': Timestamp.fromDate(new DateTime.now()),
        'gategory': {'id': '10', 'named': 'sofa'},
        'some_img': {'id': '100', 'imgs': []}
      }),
      Some.fromJson({
        'id': 'Axxiu09909L',
        'txt': 'Beauty of Sofa',
        'price': '199',
        'status': true,
        'avatar': '',
        'add_time': Timestamp.fromDate(new DateTime.now()),
        'gategory': {'id': '10', 'named': 'sofa'},
        'some_img': {'id': '100', 'imgs': []}
      })
    ];

/* 购物车 */
Future<List<Map>> loadCart() async => _cartList();

List<Map> _cartList() => [
      {'status': true, 'numed': 1, 'product': _someList()[0]},
      {'status': true, 'numed': 3, 'product': _someList()[1]},
      {'status': false, 'numed': 1, 'product': _someList()[2]},
    ];

/* 用户 */
Future<Profile> loadProf() async => Profile.fromJson({
      'id': 'vvKK009',
      'account': '+86 13576639986',
      'name': 'Qiong',
      'password': 'ZT123zlt',
      'money': '99',
      'avatar': '',
      'gender': 1,
      'background': '',
      'loginTime': new DateTime.now().toString()
    });

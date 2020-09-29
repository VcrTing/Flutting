import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sona/service/factory/factory_instance.dart';
import '../../widget/loading.dart';
import '../../service/factory/factory_model.dart';
import '../../service/profile/profile_model.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

class FactoryScreen extends StatefulWidget {
  FactoryScreen({Key key}) : super(key: key);

  @override
  _FactoryScreenState createState() => _FactoryScreenState();
}

class _FactoryScreenState extends State<FactoryScreen> {
  GlobalKey<FormState> facFormKey = GlobalKey<FormState>();
  String name;

  Widget upFactory(Factory fac, FactoryModel facModel) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          FormBuilder(
            key: facFormKey,
            autovalidate: true,
            child: Column(
              children: [
                // FLUTTER FORM BUILDER :https://pub.flutter-io.cn/packages/flutter_form_builder
                FormBuilderTextField(
                  attribute: 'name',
                  decoration: InputDecoration(labelText: 'Name'),
                  initialValue: fac.name,
                  onChanged: (value) => name = value,
                  validators: [
                    FormBuilderValidators.required(),
                    FormBuilderValidators.maxLength(20),
                    FormBuilderValidators.minLength(2),
                    FormBuilderValidators.max(8),
                    (v) {
                      // 精准验证
                      if (v == null && v.isEmpty) {
                        return 'Name shouldnt be empty.';
                      }
                    }
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text('Key: ' + fac.key),
          SizedBox(
            height: 30,
          ),
          Text('Alive: ' + fac.alive.toString()),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            onPressed: () {
              if (name == null) {
                print('无需修改');
              } else {
                fac.name = name;
                facModel.updateFactoryFirebase(fac);
              }
            },
            child: Text(
              '修改',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('来到来到来到来到来到');
    return Scaffold(
        appBar: AppBar(
          title: Text('Firebase => Factory'),
        ),
        body: Column(
          children: [
            Text('STATIC Title'),
            SizedBox(
              height: 15,
            ),
            Consumer<ProfileModel>(
              builder: (context, value, child) {
                print('profile 重绘');
                print(child.toString());
                Future.delayed(Duration(seconds: 3), () => value.changeLogin());
                return Text('isLogin: ${value.isLogin}');
              },
              child: Text('Profile Child'),
            ),
            Consumer<FactoryModel>(builder: (context, value, child) {
              value.getAsync();
              print('factory 重绘');
              return Text('AsyncTxt: ${value.asyncTxt}');
              /*
          return FutureBuilder(
            future: value.getFactoryFromFirebase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Factory fac = snapshot.data;
                return Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Text('Factory Name: ' + fac.name),
                        upFactory(fac, value)
                      ],
                    ));
              }
              return Loading();
            },
          );
          */
            }),
          ],
        ));
  }
}

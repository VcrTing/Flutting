import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import './factory_service.dart';

class FactoryScreen extends StatefulWidget {
  FactoryScreen({Key key}) : super(key: key);

  @override
  _FactoryScreenState createState() => _FactoryScreenState();
}

class _FactoryScreenState extends State<FactoryScreen> {
  GlobalKey<FormState> facFormKey = GlobalKey<FormState>();
  String name;

  Widget updateFactory() {
    Factory fac = Provider.of<FactoryModel>(context).fac;
    return Container(
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
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  onPressed: () {
                    if (name == null) {
                      print('无需修改');
                    } else {
                      fac.name = name;
                      Provider.of<FactoryModel>(context)
                          .updateFactoryFirebase(fac);
                    }
                  },
                  child: Text(
                    '修改',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget column() {
    return Column(
      children: [
        // 展示结果
        Text('查询:'),
        Consumer<FactoryModel>(
          builder: (context, value, child) {
            print('展示名字 重绘');
            return Text('名字: ${value.fac.name}');
          },
        ),
        SizedBox(
          height: 15,
        ),
        Text('修改:'),
        // updateFactory()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Provider.of<FactoryModel>(context).loadFactory();
    });
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Consumer<FactoryModel>(
            builder: (context, value, child) {
              // 获取
              value.loadFactory();
              return Text('${value.loading.toString()}');
            },
          )),
    );
  }
}

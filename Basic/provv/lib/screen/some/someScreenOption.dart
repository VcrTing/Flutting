import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:provv/model/some.dart';
import 'package:provv/provider/someModel.dart';
import '../../widget/dialog.dart';

class SomeScreenOption extends StatefulWidget {
  SomeScreenOption();

  @override
  _SomeScreenOptionState createState() => _SomeScreenOptionState();
}

class _SomeScreenOptionState extends State<SomeScreenOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black, //.withOpacity(0),
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  'assets/imgs/SEA_1080_1366.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        height: 40,
                        width: 80,
                        color: Color.fromRGBO(0, 0, 0, 0),
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 8),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
            SomeUpdateVIew()
          ],
        ),
      ),
    );
  }
}

class SomeUpdateVIew extends StatefulWidget {
  SomeUpdateVIew();

  @override
  _SomeUpdateVIewState createState() => _SomeUpdateVIewState();
}

class _SomeUpdateVIewState extends State<SomeUpdateVIew> {
  String txt;
  String price;

  Widget someFrom(Some some) {
    txt = some.txt;
    price = some.price;
    print('From 重绘');
    return Form(
        child: Column(
      children: [
        // FLUTTER FORM BUILDER :https://pub.flutter-io.cn/packages/flutter_form_builder
        FormBuilderTextField(
          attribute: 'name',
          // decoration: ,
          initialValue: some.txt,
          onChanged: (value) => txt = value,
          cursorColor: Theme.of(context).cursorColor,
          decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).buttonColor))),
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
        FormBuilderTextField(
          attribute: 'price',
          // decoration: InputDecoration(labelText: 'Price'),
          initialValue: some.price,
          onChanged: (value) => price = value,
          cursorColor: Theme.of(context).cursorColor,
          decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).buttonColor))),
          validators: [
            FormBuilderValidators.required(),
            FormBuilderValidators.maxLength(6),
            FormBuilderValidators.minLength(1),
            FormBuilderValidators.max(8),
            (v) {
              // 精准验证
              if (v == null && v.isEmpty) {
                return 'Price shouldnt be empty.';
              }
            }
          ],
        ),
        SizedBox(
          height: 25,
        ),
        RaisedButton(
            onPressed: () {
              if (txt == some.txt && price == some.price) {
                alertMessage('There are nothing gonna to change.');
              } else {
                print('修改中...');
                some.txt = txt;
                some.price = price;
                Provider.of<SomeModel>(context).updSomeOneInFirebase(some);
              }
            },
            child: Text(
              'Submit',
              style: TextStyle(color: Theme.of(context).primaryColorLight),
            ))
      ],
    ));
  }

  Widget someLoad() {
    // 传过来的参数
    dynamic urlParam = ModalRoute.of(context).settings.arguments;

    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(8)),
        child: Consumer<SomeModel>(
          builder: (context, value, child) {
            return someFrom(value.someList[urlParam['index']]);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    print('SomeUpdateVIew 重绘');
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          children: [
            Text(
              'Change It',
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            AspectRatio(
              aspectRatio: 3 / 2,
              child: someLoad(),
            )
          ],
        ));
  }
}

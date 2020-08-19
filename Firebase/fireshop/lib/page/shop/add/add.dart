import 'package:fireshop/page/shop/add/success.dart';
import 'package:flutter/material.dart';
import 'package:fireshop/model/shop.dart';
import 'package:fireshop/model/user.dart';
import 'package:provider/provider.dart';

import 'package:fireshop/util/toast.dart';
import 'package:fireshop/util/loading.dart';
import 'package:fireshop/page/shop/add/add.dart';

class AddPanel extends StatefulWidget {
  AddPanel({Key key}) : super(key: key);

  @override
  _AddPanelState createState() => _AddPanelState();
}

class _AddPanelState extends State<AddPanel> {
  String _shopAddName;
  String _shopAddContent;
  double _shopAddPriceOrigin;
  double _shopAddPriceResult;
  int _shopAddCount;
  bool _shopAddPublish;
  String _shopAddTyped;
  User user;

  // 表单 Key
  bool loading = false;
  ShopModel shopApi = ShopModel();
  final _formKey = GlobalKey<FormState>();
  List<String> shopTypes = ['甜品', '酒水', '饮料', '面包', '肉类'];

  Widget imgAdd() {
    return Column(children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.only(top: 10),
        width: double.infinity,
        child: Text(
          'Avatar Image',
          style: TextStyle(color: Colors.blue, fontSize: 18),
          textAlign: TextAlign.left,
        ),
      ),
      Container(
        width: double.infinity,
        height: 170,
        padding: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(color: Colors.white),
        child: GestureDetector(
          onTap: () {
            print('添加图片');
          },
          child: Icon(
            Icons.add,
            size: 80,
            color: Color.fromRGBO(228, 228, 228, 1),
          ),
        ),
      ),
    ]);
  }

  Widget nameInput() {
    return TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.text,
      initialValue: '',
      decoration: InputDecoration(labelText: 'Name'),
      validator: (val) => val.isEmpty ? 'Please enter a name' : null,
      onChanged: (val) => setState(() => _shopAddName = val),
    );
  }

  Widget contentInput() {
    return TextFormField(
      maxLines: 6,
      initialValue: '',
      decoration: InputDecoration(labelText: 'Content'),
      validator: (val) => val.isEmpty ? 'Please enter a shop content' : null,
      onChanged: (val) => setState(() => _shopAddContent = val),
    );
  }

  Widget priceOriginInput() {
    return TextFormField(
      maxLines: 1,
      maxLength: 8,
      keyboardType: TextInputType.number,
      initialValue: '',
      decoration: InputDecoration(labelText: 'Price Origin'),
      validator: (val) => val.isEmpty ? 'Please enter a price' : null,
      onChanged: (val) =>
          setState(() => _shopAddPriceOrigin = double.parse(val)),
    );
  }

  Widget priceResultInput() {
    return TextFormField(
      maxLines: 1,
      maxLength: 8,
      keyboardType: TextInputType.number,
      initialValue: '',
      decoration: InputDecoration(labelText: 'Price Result'),
      validator: (val) => val.isEmpty ? 'Please enter a price' : null,
      onChanged: (val) =>
          setState(() => _shopAddPriceResult = double.parse(val)),
    );
  }

  Widget shopCountInput() {
    return TextFormField(
      maxLines: 1,
      maxLength: 11,
      keyboardType: TextInputType.number,
      initialValue: '',
      decoration: InputDecoration(labelText: 'Shop Count'),
      validator: (val) => val.isEmpty ? 'Please enter a number' : null,
      onChanged: (val) => setState(() => _shopAddCount = int.parse(val)),
    );
  }

  Widget shopPulish() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            'Publish',
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
          width: double.infinity,
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio(
                      value: true,
                      groupValue: _shopAddPublish,
                      onChanged: (val) =>
                          setState(() => _shopAddPublish = val)),
                  Text('Yes')
                ],
              ),
              flex: 1,
            ),
            Expanded(
              child: Row(
                children: [
                  Radio(
                      value: false,
                      groupValue: _shopAddPublish,
                      onChanged: (val) =>
                          setState(() => _shopAddPublish = val)),
                  Text('No')
                ],
              ),
              flex: 1,
            )
          ],
        )
      ],
    );
  }

  Widget typedSelect() {
    return DropdownButtonFormField(
        decoration: InputDecoration(labelText: 'Shop Type'),
        value: _shopAddTyped,
        items: shopTypes.map((typed) {
          return DropdownMenuItem(
            value: typed,
            child: Text(typed),
          );
        }).toList(),
        onChanged: (val) => setState(() => _shopAddTyped = val));
  }

  Widget submitAdd() {
    return Container(
      child: RaisedButton(
        color: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            try {
              Shop shop = Shop();

              shop.basic(
                  user.uid,
                  _shopAddName,
                  _shopAddContent,
                  _shopAddPriceOrigin,
                  _shopAddPriceResult,
                  _shopAddCount,
                  _shopAddCount,
                  null,
                  _shopAddPublish,
                  _shopAddTyped,
                  '', []);

              bool res = shopApi.addOne(shop);

              if (res == true) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ShopAddSuccess()));
              } else {
                alert('Add Product Fail.');
              }
            } catch (e) {
              alert('Add Product Fail.');
            }
          }
        },
        child: Text(
          'Submit',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<User>(context);
    return loading
        ? Loading()
        : Container(
            margin: EdgeInsets.only(bottom: 90),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    imgAdd(),
                    SizedBox(
                      height: 15,
                    ),
                    nameInput(),
                    SizedBox(
                      height: 15,
                    ),
                    priceOriginInput(),
                    SizedBox(
                      height: 15,
                    ),
                    priceResultInput(),
                    SizedBox(
                      height: 15,
                    ),
                    shopCountInput(),
                    SizedBox(
                      height: 15,
                    ),
                    shopPulish(),
                    SizedBox(
                      height: 15,
                    ),
                    typedSelect(),
                    SizedBox(
                      height: 15,
                    ),
                    contentInput(),
                    SizedBox(
                      height: 30,
                    ),
                    submitAdd()
                  ],
                )));
  }
}

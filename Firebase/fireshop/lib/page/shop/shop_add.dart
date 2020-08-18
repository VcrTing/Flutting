import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'add/add.dart';

class ShopAdd extends StatefulWidget {
  ShopAdd({Key key}) : super(key: key);

  @override
  _ShopAddState createState() => _ShopAddState();
}

class _ShopAddState extends State<ShopAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品添加'),
      ),
      body: AddContent(),
    );
  }
}

class AddContent extends StatefulWidget {
  AddContent({Key key}) : super(key: key);

  @override
  _AddContentState createState() => _AddContentState();
}

class _AddContentState extends State<AddContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(245, 245, 245, 1),
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: AddPanel(),
      ),
    );
  }
}

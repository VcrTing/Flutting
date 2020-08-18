import 'package:flutter/material.dart';
import 'package:fireshop/tabs.dart';

class ShopAddSuccess extends StatefulWidget {
  ShopAddSuccess({Key key}) : super(key: key);

  @override
  _ShopAddSuccessState createState() => _ShopAddSuccessState();
}

class _ShopAddSuccessState extends State<ShopAddSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Icon(
              Icons.access_alarm,
              size: 90,
              color: Colors.lightGreen,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Product add success.',
              style: TextStyle(color: Colors.green, fontSize: 24),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            TabBarControllerPage()));
              },
              child: Text('Look All Product'),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            )
          ],
        ),
      ),
    );
  }
}

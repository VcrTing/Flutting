import 'package:flutter/material.dart';
import 'PaypalPayment.dart';

class BuyByPaypal extends StatefulWidget {
  BuyByPaypal({Key key}) : super(key: key);

  @override
  _BuyByPaypalState createState() => _BuyByPaypalState();
}

class _BuyByPaypalState extends State<BuyByPaypal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paypal'),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Color.fromRGBO(243, 243, 243, 1)),
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Text('You will pay by paypal.'),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => PaypalPayment(
                      onFinish: (number) async {
                        // payment done
                        print('order id: ' + number);
                      },
                    ),
                  ),
                );
              },
              child: Text('Do it now'),
            )
          ],
        ),
      ),
    );
  }
}

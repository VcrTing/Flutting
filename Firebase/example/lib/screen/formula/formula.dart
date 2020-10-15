import 'package:example/widgets/button/primaryButton.dart';
import 'package:example/widgets/gradient/linear.dart';
import 'package:flutter/material.dart';

class FormulaScreen extends StatefulWidget {
  FormulaScreen({Key key}) : super(key: key);

  @override
  _FormulaScreenState createState() => _FormulaScreenState();
}

class _FormulaScreenState extends State<FormulaScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            linearLine(context),
            Text('Default !'),
            Text(
              'body1',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'body2',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              'head1',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'head2',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'head3',
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              'head4',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'head5',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'head6',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 20,
            ),
            confirmButton(context, 'Confirm'),
            SizedBox(
              height: 20,
            ),
            primaryButton(context, '开始', () {}),
            SizedBox(
              height: 20,
            ),
            nearButton(context, '开始'),
            Icon(Icons.home),
          ],
        ),
      ),
    );
  }
}

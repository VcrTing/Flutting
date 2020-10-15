import 'package:animate_do/animate_do.dart';
import 'package:example/common/style.dart';
import 'package:example/common/style/_ui.dart';
import 'package:example/widgets/brand/brand.dart';
import 'package:example/widgets/button/primaryButton.dart';

import 'package:example/widgets/gradient/linear.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// 界面
Widget confirmOption(BuildContext context, int index, bool select,
        Function funcTrue, Function funcFalse,
        [double _optionTop = 3]) =>
    Container(
      width: 60,
      height: 30,
      child: Stack(
        children: [
          Positioned(
            left: 10,
            top: (_optionTop + 1),
            child: LimitedBox(
              child: Container(
                alignment: Alignment.center,
                width: 40,
                height: 21,
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        vertical: BorderSide(
                            color: select
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).accentColor,
                            width: 2))),
                child: Text(''),
              ),
              maxWidth: 40,
              maxHeight: 21,
            ),
          ),
          Positioned(
            left: 0,
            top: _optionTop,
            child: LimitedBox(
              child: RaisedButton(
                shape: CircleBorder(),
                padding: EdgeInsets.all(0),
                color: select
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).accentColor,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 16,
                ),
                onPressed: () => funcTrue(index, 1),
              ),
              maxWidth: 22,
              maxHeight: 23,
            ),
          ),
          Positioned(
            right: 0,
            top: _optionTop,
            child: LimitedBox(
              child: RaisedButton(
                shape: CircleBorder(),
                padding: EdgeInsets.all(0),
                color: select
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).accentColor,
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 16,
                ),
                onPressed: () => funcFalse(index, -1),
              ),
              maxWidth: 22,
              maxHeight: 23,
            ),
          )
        ],
      ),
    );

class AskContent extends StatefulWidget {
  AskContent({Key key}) : super(key: key);

  @override
  _AskContentState createState() => _AskContentState();
}

class _AskContentState extends State<AskContent> {
  AnimationController _animationController;
  List askList = [
    {'name': 'N1-02716', 'size': '0.4M', 'select': true},
    {'name': 'Y1-35689', 'size': '0.3m', 'select': false},
    {'name': 'G2-46538', 'size': '0.5m', 'select': false}
  ];

  List confirmList = [2, 2, 1];

  _confirmNum(int index, int numed) {
    setState(() {
      confirmList[index] += numed;
      if (confirmList[index] < 0) {
        confirmList[index] = 0;
      }
    });
  }

  Widget confirmId(int index, bool select) => Container(
      width: 40,
      height: 30,
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: select
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(40)),
            child: Text('${index + 1}',
                style: TextStyle(
                  color: Colors.white,
                )),
          )
        ],
      ));

  Widget productEvery(int index, String name, String size, bool select) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizon, vertical: horizon),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: bgColorDeep, width: 1))),
      child: Row(
        children: [
          Expanded(
            child: confirmId(index, select),
            flex: 1,
          ),
          Expanded(
            child: Container(
              child: Text(name),
              padding: EdgeInsets.only(left: horizon),
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              child: Text(size + ' ${confirmList[index]}' + '份'),
              alignment: Alignment.center,
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
                alignment: Alignment.centerRight,
                child: confirmOption(context, index, select, this._confirmNum,
                    this._confirmNum)),
            flex: 2,
          )
        ],
      ),
    );
  }

  List<Widget> confirm() {
    List<Widget> res = [];
    for (int i = 0; i < askList.length; i++) {
      Map e = askList[i];
      res.add(productEvery(i, e['name'], e['size'], e['select']));
    }

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 190,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [...confirm()],
              ),
            ),
          ),
          FadeInUp(
            duration: Duration(milliseconds: 1000),
            controller: (controller) => _animationController = controller,
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: horizon, vertical: horizonL),
              child: confirmButton(context, 'Confirm'),
            ),
          )
        ],
      ),
    );
  }
}

class AskAnotherContent extends StatefulWidget {
  AskAnotherContent({Key key}) : super(key: key);

  @override
  _AskAnotherContentState createState() => _AskAnotherContentState();
}

class _AskAnotherContentState extends State<AskAnotherContent> {
  List askAnotherList = [
    {
      'name': 'Daily UVSPF 15 PA++',
      'size': '0.4M',
    },
    {
      'name': 'Ultra-Silk Sunscreen',
      'size': '0.3m',
    },
  ];

  List confirmList = [0, 0];

  _confirmNum(int index, int numed) {
    setState(() {
      confirmList[index] += numed;
      if (confirmList[index] < 0) {
        confirmList[index] = 0;
      }
    });
  }

  Widget anotherEvery(int index, String name, String size) => Container(
        padding: EdgeInsets.symmetric(horizontal: horizon),
        margin: EdgeInsets.only(bottom: horizon),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: horizon, vertical: horizon),
                decoration: BoxDecoration(
                    color: bgColorDeep,
                    borderRadius: BorderRadius.circular(distance)),
                child: Text(name),
              ),
              flex: 5,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: confirmOption(
                    context, index, false, this._confirmNum, this._confirmNum),
              ),
              flex: 2,
            ),
          ],
        ),
      );

  List<Widget> anotherContent() {
    List<Widget> res = [];
    for (int i = 0; i < askAnotherList.length; i++) {
      Map e = askAnotherList[i];
      res.add(anotherEvery(i, e['name'], e['size']));
    }

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [...anotherContent()],
      ),
    );
  }
}

class AskScreen extends StatefulWidget {
  AskScreen({Key key}) : super(key: key);

  @override
  _AskScreenState createState() => _AskScreenState();
}

class _AskScreenState extends State<AskScreen> {
  double linearNum = 0.8;

  // 分割线
  Widget diliverTitle(txt, [bool background = true]) => Container(
        width: double.infinity,
        decoration: BoxDecoration(color: background ? bgColorDeep : null),
        padding: EdgeInsets.symmetric(horizontal: horizon, vertical: distance),
        child: Text(
          txt,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.w300),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            linearLine(context),
            brand(context, Theme.of(context).textTheme.bodyText1.color),
            diliverTitle('问卷资料'),
            AskContent(),
            diliverTitle('另加产品', false),
            AskAnotherContent()
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sona/firebase/someProvider.dart';
import 'package:sona/some.dart';

class TestFire extends StatefulWidget {
  TestFire({Key key}) : super(key: key);

  @override
  _TestFireState createState() => _TestFireState();
}

class _TestFireState extends State<TestFire> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {});
    String ptxt = Provider.of<String>(context);

    Some fac = Provider.of<Some>(context);

    SomeModel some = Provider.of<SomeModel>(context);
    print('Test 重绘');
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Center(
            child: Column(
              children: [
                Text(
                  '导致全局重绘的 Provider',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 168, 243, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Text('Ptxt = $ptxt'),
                Text('Future Factory = $fac'),
                Text('Some s Txt = ${some.txt}'),
                RaisedButton(
                  onPressed: () => some.loadTxt(),
                  child: Text('获取 Some s Txt'),
                ),
                /*
            FutureBuilder(
              future: some.loadThing(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done)
                  return Text('Some s txt of Some = ${some.some[0].txt}');

                return Text('waiting for get Some s txt of Some');
              },
            ),
            */
                SizedBox(
                  height: 15,
                ),
                SomeComplex(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '部分重绘使用 Comsumer',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 168, 243, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                SomeConmuser(),
              ],
            ),
          )),
    );
  }
}

class SomeComplex extends StatefulWidget {
  SomeComplex({Key key}) : super(key: key);

  @override
  _SomeComplexState createState() => _SomeComplexState();
}

class _SomeComplexState extends State<SomeComplex> {
  @override
  Widget build(BuildContext context) {
    SomeModel some = Provider.of<SomeModel>(context);
    print('SomeComplex 重绘');

    return Column(children: [
      Text(
        'Lets get something.',
        style: TextStyle(color: Color.fromRGBO(255, 174, 200, 1)),
      ),
      some.someList.length <= 0
          ? Text('waiting for get Some s txt of Some')
          : Text('Some s txt of Some = ${some.someList[0].txt}'),
      RaisedButton(
        onPressed: () => some.getThing(),
        child: Text('获取 Some s Txt of Some'),
      ),
      SizedBox(
        height: 15,
      ),
      some.someList.length <= 0
          ? Text('Future no send some here.')
          : Text('Txt in the Future = ${some.someList[0].txt}'),
      RaisedButton(
        onPressed: () {
          print('Future Start');
          some.getThingInFuture();
          print('Future End');
        },
        child: Text('获取 Future Some s Txt of Some'),
      ),
      // FIREBASE
      SizedBox(
        height: 15,
      ),
      Text(
        'Lets get something in the Firebase.',
        style: TextStyle(color: Color.fromRGBO(255, 174, 200, 1)),
      ),
      some.someList.length <= 0
          ? Text('Firebase no send some here.')
          : Text('Txt in the Firebase = ${some.someList[0].txt}'),
      RaisedButton(
        onPressed: () {
          print('Firebase Start');
          some.getSomeListFromFirebase();
          print('Firebase End');
        },
        child: Text('获取 Some s Txt of Firebase Some'),
      )
    ]);
  }
}

class SomeConmuser extends StatefulWidget {
  SomeConmuser({Key key}) : super(key: key);

  @override
  _SomeConmuserState createState() => _SomeConmuserState();
}

class _SomeConmuserState extends State<SomeConmuser> {
  @override
  Widget build(BuildContext context) {
    print('SomeConmuser 重绘');
    return Container(
      child: Column(
        children: [
          Consumer<SomeModel>(
            builder: (context, value, child) {
              return Text('Txt = ${value.someList[0].txt}');
            },
          ),
          RaisedButton(
            onPressed: () => Provider.of<SomeModel>(context, listen: false)
                .getSomeListFromFirebase(),
            child: Text('获取 Firebase s Some'),
          )
        ],
      ),
    );
  }
}

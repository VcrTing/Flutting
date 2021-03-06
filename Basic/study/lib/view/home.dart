import 'package:flutter/material.dart';

import '../util/space.dart';
import '../widget/_index.dart';
import '../design/tab.dart';

// LIST
class Content extends StatefulWidget {
  Content({Key key}) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[toWidget(), EMPTY(30), toTab()],
      ),
    );
  }

  Widget toWidget() {
    return RaisedButton(
      onPressed: () {
        print('跳转到 Widget!!!');
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return WidgetIndex();
        }));
      },
      child: Text('跳转至 Widget'),
    );
  }

  Widget toTab() {
    return RaisedButton(
      onPressed: () {
        print('跳转到 TabBar!!!');
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return TabBarControllerPage();
        }));
      },
      child: Text('跳转至 TabBar'),
    );
  }
}

class IndexView extends StatefulWidget {
  IndexView({Key key}) : super(key: key);

  @override
  _IndexViewState createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[header(), EMPTY(30.0), Content()],
      ),
    );
  }

  Widget header() {
    return Column(
      children: <Widget>[Text('代码查看')],
    );
  }
}

// HOME
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.menu), tooltip: 'Navi Menu', onPressed: null),
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search), tooltip: 'Search', onPressed: null)
          ]),
      body: Center(child: IndexView()),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provv/model/some.dart';
import 'package:provv/provider/someModel.dart';

class SomeScreenTheBlog extends StatefulWidget {
  String someId;
  SomeScreenTheBlog({this.someId, Key key}) : super(key: key);

  @override
  _SomeScreenTheBlogState createState() => _SomeScreenTheBlogState();
}

class _SomeScreenTheBlogState extends State<SomeScreenTheBlog> {
  String someId;

  // 默认视图
  Widget defBlogContent() => Container(
        child: Column(
          children: [
            Text('Waiting...'),
            Container(
              height: 300,
            )
          ],
        ),
      );

  // 顶部工具栏
  Widget topBar() => SafeArea(
          child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).accentIconTheme.color,
                ),
                onTap: () {
                  print('返回');
                  Navigator.pop(context);
                },
              ),
            ),
            flex: 2,
          ),
        ],
      ));

  // 博客内容
  Widget blogContent() => FutureBuilder(
      future:
          Provider.of<SomeModel>(context).getSomeOneInFirebase(widget.someId),
      builder: (context, snapshot) {
        print('开始获取 Some id = ${widget.someId} 的数据');
        if (snapshot.connectionState == ConnectionState.done) {
          Some some = snapshot.data;
          return Column(children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'Cloud Firestore and App Engine: ',
                    style: Theme.of(context).accentTextTheme.headline6),
                TextSpan(
                    text: '${some.txt}, You cant use both Cloud Firestore and Cloud Datastore in the same project, ' +
                        'which might affect apps using App Engine. ' +
                        'Try using Cloud Firestore with a different project.',
                    style: Theme.of(context).textTheme.bodyText1)
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                'The Firebase guides are step-by-step walkthroughs that help you get started using Firebase. ' +
                    'Choose your preferred platform from the list below.'),
            SizedBox(
              height: 20,
            ),
            Text('Except as otherwise noted, ' +
                'the content of this page is licensed under the Creative Commons Attribution 4.0 License, ' +
                'and code samples are licensed under the Apache 2.0 License. ' +
                'For details, see the Google Developers Site Policies. ' +
                'Java is a registered trademark of Oracle and/or its affiliates.' +
                'Except as otherwise noted, ' +
                'the content of this page is licensed under the Creative Commons Attribution 4.0 License, ' +
                'and code samples are licensed under the Apache 2.0 License. ' +
                'For details, see the Google Developers Site Policies. ' +
                'Java is a registered trademark of Oracle and/or its affiliates.' +
                'Except as otherwise noted, ' +
                'the content of this page is licensed under the Creative Commons Attribution 4.0 License, ' +
                'and code samples are licensed under the Apache 2.0 License. ' +
                'For details, see the Google Developers Site Policies. ' +
                'Java is a registered trademark of Oracle and/or its affiliates.'),
            SizedBox(
              height: 20,
            ),
            Text('Last updated 2020-08-21 UTC.'),
            SizedBox(
              height: 30,
            ),
          ]);
        }
        return defBlogContent();
      });

  // 负责展示博客
  Widget blogView() {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Stack(alignment: Alignment.topCenter, children: [
            Positioned(
              child: Container(
                width: constraints.maxWidth,
                height: 400,
                child: Image.asset(
                  'assets/imgs/SEA_1080_1366.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              child: Container(
                  height: 100,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  // color: Colors.black26,
                  child: topBar()),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Container(
                  height: 600,
                  margin: EdgeInsets.only(top: 200),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorLight),
                          padding: EdgeInsets.symmetric(
                              vertical: 60, horizontal: 15),
                          alignment: Alignment.topLeft,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: blogContent(),
                          ))),
                ),
              ),
            ),
          ]));
    });
  }

  @override
  Widget build(BuildContext context) {
    // 传来的参数
    // dynamic urlParam = ModalRoute.of(context).settings.arguments;
    // Some Id
    // someId =  urlParam['someId'];

    // 获取 Some
    // Provider.of<SomeModel>(context).getSomeOneInFirebase(someId);

    return Scaffold(
        body: Container(
      child: blogView(),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provv/provider/someModel.dart';

// 拖拽后停留的视图
Widget someEveryFeedback(BuildContext context) => Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColor,
      ),
      child: Text(''),
      width: double.infinity,
    );

// 没有数据时的视图
Widget someDefShow(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(200),
    clipBehavior: Clip.hardEdge,
    child: Container(
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: 60),
      margin: EdgeInsets.symmetric(vertical: 15),
      // color: Colors.black38,
      child: Column(
        children: [Text('Click to load Some Data.')],
      ),
    ));

// 打开 Sheet
void someSheet(BuildContext context) {
  Provider.of<SomeModel>(context, listen: false).getSomeTrashFromFirebase();
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return trashSheet(context);
      });
}

// 回收站
Widget trashSheet(BuildContext context) => Container(
      color: Theme.of(context).primaryColorLight,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'The Recycle Bin',
              style: TextStyle(
                  fontSize: 24,
                  // color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            Container(
                height: 300,
                margin: EdgeInsets.only(top: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Consumer<SomeModel>(
                    builder: (context, value, child) {
                      print('回收站视图 重绘');
                      if (value.someTrash.length > 0) {
                        List<Widget> res = [];
                        value.someTrash.forEach((element) {
                          res.add(Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            margin: EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: Theme.of(context).backgroundColor,
                                borderRadius: BorderRadius.circular(3)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(element.txt,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  flex: 4,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    child: Container(
                                      child: Icon(
                                        Icons.refresh,
                                        color:
                                            Theme.of(context).iconTheme.color,
                                      ),
                                      alignment: Alignment.centerRight,
                                    ),
                                    onTap: () {
                                      value.backSomeInFirebase(element.id);
                                    },
                                  ),
                                  flex: 1,
                                )
                              ],
                            ),
                          ));
                        });
                        return Column(
                          children: res,
                        );
                      } else {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 120),
                          child: Text('Waiting.'),
                        );
                      }
                    },
                  ),
                )),
            Container(
              margin: EdgeInsets.only(top: 5),
              width: double.infinity,
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Close it',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            )
          ],
        ),
      ),
    );

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provv/model/some.dart';
import 'package:provv/provider/appProvider.dart';
import 'package:provv/provider/someModel.dart';
import 'package:provv/screen/some/someScreenOption.dart';
import 'package:provv/screen/some/someScreenTheBlog.dart';

import './someScreenInner.dart';
import '../../widget/dialog.dart';

class SomeScreen extends StatefulWidget {
  SomeScreen({Key key}) : super(key: key);

  @override
  _SomeScreenState createState() => _SomeScreenState();
}

class _SomeScreenState extends State<SomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).primaryColorLight,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Center(
        child: Column(
          children: [
            SomeListView(),
          ],
        ),
      ),
    );
  }
}

// 获取 List 列表

class SomeListView extends StatefulWidget {
  SomeListView({Key key}) : super(key: key);

  @override
  _SomeListViewState createState() => _SomeListViewState();
}

class _SomeListViewState extends State<SomeListView> {
  List<int> someSelect = [0];
  ValueNotifier<int> count = ValueNotifier<int>(0);

  double animatePaddingSomeDef = 0;

  void someChoise(index) {
    setState(() {
      someSelect = [];
      someSelect.add(index);
    });
  }

  void someTrash(String id) {
    if (id == null || id == '') {
      return;
    } else {
      if (alertConfirm('Are you show delete it?'))
        Provider.of<SomeModel>(context, listen: false).delSomeInFirebase(id);
    }
  }

  void someLook(Some some) {
    /*
    Navigator.of(context).pushNamed('/some_theblog', arguments: {
      'someId': some.id
    }).then((value) => print('接收传回来的参数 = $value'));
    */
  }

  // 项目操作
  Widget someOptionView() => Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 15),
              child: RaisedButton(
                // color: Theme.of(context).buttonColor,
                onPressed: () {
                  Navigator.of(context).pushNamed('/some_option', arguments: {
                    'index': someSelect[0]
                  }).then((value) => print('接收传回来的参数 = $value'));
                },
                child: Text(
                  'Update',
                  style: TextStyle(color: Theme.of(context).primaryColorLight),
                ),
              ),
              alignment: Alignment.bottomRight,
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 15),
              child: RaisedButton(
                  color: Theme.of(context).errorColor,
                  onPressed: () => this.someTrash(
                      Provider.of<SomeModel>(context, listen: false)
                          .someList[someSelect[0]]
                          .id),
                  child: Text(
                    'Delete',
                    // style: Theme.of(context).textTheme.headline6
                    style:
                        TextStyle(color: Theme.of(context).primaryColorLight),
                  )),
              alignment: Alignment.centerLeft,
            ),
            flex: 2,
          ),
        ],
      );

  // 每一个数据项目
  Widget someEvery(Some some, int index) {
    bool selected = someSelect.contains(index);
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).primaryColor,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '${some.txt}',
                style: TextStyle(
                    color: selected
                        ? Theme.of(context).textSelectionColor
                        : Theme.of(context).textTheme.bodyText1.color),
              ),
              flex: 6,
            ),
            Expanded(
              child: Text(
                '\$ ${some.price}',
                style: TextStyle(
                    color: selected
                        ? Theme.of(context).textSelectionColor
                        : Theme.of(context).textTheme.bodyText1.color),
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(
                child: OpenContainer<bool>(
                  // transitionType: ContainerTransitionType.valu,
                  openBuilder:
                      (BuildContext context, VoidCallback openContainer) {
                    return SomeScreenTheBlog(
                      someId: some.id,
                    );
                  },
                  onClosed: (data) => print('SOME ONE ON CLOSED DATA = $data'),
                  tappable: false,
                  closedBuilder: (BuildContext context, VoidCallback action) {
                    return InkWell(
                        child: Icon(
                          Icons.panorama_fish_eye,
                          color: selected
                              ? Theme.of(context).textSelectionColor
                              : Theme.of(context).primaryIconTheme.color,
                        ),
                        onTap: () {
                          action();
                        } // someLook(some),
                        );
                  },
                ),
                alignment: Alignment.centerRight,
              ),
              flex: 1,
            ),
          ],
        ),
      ),
      onTap: () {
        someChoise(index);
      },
    );
  }

  // 数据列表
  Widget someListShow() => Container(
        decoration: BoxDecoration(),
        child: Consumer<SomeModel>(builder: (context, value, child) {
          print('数据重获取');
          List<Widget> res = [];

          if (value.someList.length > 0) {
            int index = -1;
            value.someList.forEach((element) {
              index += 1;

              /*
              res.add(Draggable(
                onDragCompleted: () => print('目标移动至目的地成功！！！'),
                onDragStarted: () => print('开始拖拽！！！'),
                child: someEvery(element, index),
                feedback: someEveryFeedback(context),
              ));
              */
              res.add(someEvery(element, index));
            });
            count.value = index + 1;
            MediaQueryData mq = MediaQuery.of(context);
            print(mq.size.height);
            // 已获取到数据的 列表视图
            return Column(
              children: [
                Container(
                  height: mq.size.height - 365,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Theme.of(context).platform == TargetPlatform.iOS
                          ? CupertinoScrollbar(
                              child: Column(
                                children: [...res],
                              ),
                            )
                          : Scrollbar(
                              child: Column(
                                children: [...res],
                              ),
                            )),
                ), // 拆封 res 数组元素 后将元素加入到 children 中
                SizedBox(
                  height: 30,
                ),
                someOptionView() // 修改与删除
              ],
            );
          } else {
            // 未获取到数据时的 默认视图
            return InkWell(
                onTap: () {
                  animatePaddingSomeDef += 10;
                  value.getSomeFromFirebase();
                },
                child: AnimatedPadding(
                  curve: Curves.linear,
                  padding:
                      EdgeInsets.symmetric(vertical: animatePaddingSomeDef),
                  duration: Duration(seconds: 1),
                  child: someDefShow(context),
                ));
          }
        }),
      );

  // 标题
  Widget pageTitle() => Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Tooltip(
            message: 'Show data list of the some model.',
            child: Text(
              'SomeList',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          ValueListenableBuilder(
              // 推荐使用 ValueListenableBuilder 监听这种小变化
              valueListenable: count,
              builder: (context, value, child) {
                return Text(
                  '$value of items',
                  style: Theme.of(context).accentTextTheme.bodyText1,
                );
              })
        ],
      ));

  Widget pageIn() => Container(
        child: Column(
          children: [pageTitle(), someListShow()],
        ),
      );

  @override
  Widget build(BuildContext context) {
    print('SomeList build 重绘');
    return Theme.of(context).platform == TargetPlatform.iOS
        ? CupertinoScrollbar(
            child: pageIn(),
          )
        : Scrollbar(
            child: pageIn(),
          );
  }
}

// Animations - Some One Look

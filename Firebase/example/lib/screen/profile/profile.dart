import 'package:example/common/style/_contain.dart';
import 'package:example/common/style/_ui.dart';
import 'package:example/widgets/button/primaryButton.dart';
import 'package:example/widgets/gradient/linear.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProfileMsg extends StatefulWidget {
  ProfileMsg({Key key}) : super(key: key);

  @override
  _ProfileMsgState createState() => _ProfileMsgState();
}

class _ProfileMsgState extends State<ProfileMsg> {
  Widget facepanel() => Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(horizontal: horizon),
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(horizon),
              gradient: geadientLinear(context, 0.3)),
          child: Container(
            width: 110,
            height: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(horizon),
              child: Image.asset('assets/AVATAR Blue.jpg'),
            ),
            decoration: BoxDecoration(
                color: bgColorDeep,
                borderRadius: BorderRadius.circular(horizon)),
          ),
        ),
      );

  Widget backPanel(String named,
          [String sub = 'thsrtsr', double faceL = 145]) =>
      Container(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(
                  faceL, horizonL * 4, horizon, (horizon / 2)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      named,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      sub,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1.color),
                    ),
                  )
                ],
              ),
            ),
            linearLine(context),
            Container(
              width: double.infinity,
              alignment: Alignment.topLeft,
              padding:
                  EdgeInsets.fromLTRB(faceL, horizon, horizon, horizon * 2),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: nearButton(context, '开始'),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: horizon,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.settings,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: backPanel('Queenie'),
          ),
          Positioned(
            top: 100,
            child: facepanel(),
          )
        ],
      ),
    );
  }
}

class NewNews extends StatefulWidget {
  NewNews({Key key}) : super(key: key);

  @override
  _NewNewsState createState() => _NewNewsState();
}

class _NewNewsState extends State<NewNews> {
  List newsList = [
    {'named': 'HEXAGONAL 法国品牌', 'timed': '2020.03.04 - 04.27'},
  ];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));

    setState(() {
      newsList.add(newsList[0]);
    });
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));

    setState(() {
      newsList.add(newsList[0]);
    });
    _refreshController.loadComplete();
  }

  Widget newsEvery(int id, String named, String timed) => Container(
        child: Column(
          children: [
            Container(
              height: 1,
            ),
            Container(
              color: Theme.of(context).backgroundColor,
              child: ListTile(
                title: Text(named),
                subtitle: Text(timed),
              ),
            )
          ],
        ),
      );

  List<Widget> newsContent() {
    List<Widget> res = [];
    for (int i = 0; i < newsList.length; i++) {
      Map e = newsList[i];
      res.add(newsEvery(i, e['named'], e['timed']));
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 478,
        color: bgColorDeep,
        child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: false,
            header: WaterDropHeader(),
            /*
            footer:
                CustomFooter(builder: (BuildContext context, LoadStatus mode) {
              List<Widget> res = [];
              Widget body;
              if (mode == LoadStatus.idle) {
                body = Text('Pull up load');
              } else if (mode == LoadStatus.loading) {
                body = CupertinoActivityIndicator();
              } else if (mode == LoadStatus.failed) {
                body = Text('Load Failed! Click retry!');
              } else if (mode == LoadStatus.canLoading) {
                body = Text('Release to load more');
              } else {
                body = Text('No more Data');
              }

              return Container(
                child: body,
              );
            }),
            */
            controller: _refreshController,
            onLoading: _onLoading,
            onRefresh: _onRefresh,
            child: ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return newsEvery(
                    index, newsList[index]['named'], newsList[index]['timed']);
              },
            )));
  }
}

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ProfileMsg(),
          Container(
            height: 1,
            color: Theme.of(context).accentColor,
          ),
          NewNews()
        ],
      ),
    );
  }
}

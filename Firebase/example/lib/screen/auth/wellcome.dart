import 'package:example/common/style.dart';
import 'package:example/tab.dart';
import 'package:example/widgets/brand/brand.dart';
import 'package:example/widgets/button/gredientButton.dart';
import 'package:example/widgets/gradient/linear.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 共用 标题
Widget bannerTitleH4(BuildContext context, String txt) => Text(
      txt,
      style: Theme.of(context)
          .textTheme
          .headline4
          .copyWith(color: Theme.of(context).backgroundColor),
    );
// 共用 标题
Widget bannerTitleH3(BuildContext context, String txt) => Text(
      txt,
      style: Theme.of(context)
          .textTheme
          .headline3
          .copyWith(color: Theme.of(context).backgroundColor),
    );
// 共用 标题
Widget bannerTitleH2(BuildContext context, String txt) => Text(
      txt,
      style: Theme.of(context)
          .textTheme
          .headline2
          .copyWith(color: Theme.of(context).backgroundColor),
    );

class WellComeScreen extends StatefulWidget {
  WellComeScreen({Key key}) : super(key: key);

  @override
  _WellComeScreenState createState() => _WellComeScreenState();
}

class _WellComeScreenState extends State<WellComeScreen> {
  Widget facePanel(String img, [double faceW = 110]) => Container(
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
            gradient: geadientLinear(context, 0.2),
            borderRadius: BorderRadius.circular(horizon)),
        child: Container(
          width: faceW,
          height: faceW,
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(horizon)),
          child: ClipRRect(
            child: Image.asset('assets/AVATAR Blue.jpg'),
            borderRadius: BorderRadius.circular(horizon),
          ),
        ),
      );

  Widget profilePanel(String id, String named, String img) => Column(
        children: [
          bannerTitleH3(context, '  恭喜你，'),
          bannerTitleH2(context, named),
          SizedBox(
            height: horizon * 3,
          ),
          bannerTitleH4(context, '欢迎你加入'),
          Container(
            margin: EdgeInsets.symmetric(vertical: horizon / 2),
            alignment: Alignment.center,
            child: facePanel(img),
          ),
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: horizon * 7, vertical: horizon * 2),
              child: GestureDetector(
                child: shanningButton(context, '开始体验'),
                onTap: () {
                  print('开始体验');
                  Get.to(MainTab(
                    pageIndex: 0,
                  ));
                },
              )),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).backgroundColor,
            ),
            onTap: () => Get.back(),
          ),
          // title: brand(context, Theme.of(context).backgroundColor),
        ),
        body: Container(
          color: Theme.of(context).primaryColorDark,
          child: Column(
            children: [
              linearLine(context),
              SizedBox(
                height: horizonL * 2,
              ),
              profilePanel('', 'Queenie!', ''),
              SizedBox(
                height: horizon * 2,
              ),
              linearLine(context),
              SizedBox(
                height: horizon * 2,
              ),
              brandAndLogo(context, Theme.of(context).backgroundColor)
            ],
          ),
        ));
  }
}

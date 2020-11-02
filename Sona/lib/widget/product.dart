import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/common/util/time.dart';
import 'package:sona/model/some/some.dart';
import 'package:sona/widget/title.dart';

import 'imager.dart';

// 竖向产品列表
class ProductWidget extends StatelessWidget {
  ProductWidget({this.some, this.sub, Key key}) : super(key: key);

  Some some;
  int sub;

  Widget productTitle(BuildContext context) => Text(
        some.txt,
        maxLines: 2,
      );

  Widget productSub(BuildContext context) => sub == 0
      ? subTitle(context, timestampFmt(some.add_time))
      : subTitle(context, 'sale: ' + some.price.toString());

  // 产品信息
  Widget productMsg(BuildContext context) => Column(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: imager(context, some.avatar == null ? '' : some.avatar),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(
                horizontal: horizon, vertical: horizon / 2),
            child: productTitle(context),
          ),
          Container(
            child: productSub(context),
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(horizontal: horizon),
          )
        ],
      );

  // 面板样式
  BoxDecoration panelStyle(BuildContext context) => BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(distance),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .color
                    .withOpacity(0.1),
                blurRadius: horizonT)
          ]);

  @override
  Widget build(BuildContext context) {
    double itemW = (MediaQuery.of(context).size.width / 2) - 8;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: horizon / 2),
        width: itemW,
        margin: EdgeInsets.only(bottom: horizon),
        child: Container(
            padding: EdgeInsets.only(bottom: horizonT / 2),
            decoration: panelStyle(context),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(distance),
                child: productMsg(context))));
  }
}

Widget productWithTime(Some some, [Key key]) => ProductWidget(
      some: some,
      sub: 0,
      key: key,
    );

Widget productWithSale(Some some, [Key key]) => ProductWidget(
      some: some,
      sub: 1,
      key: key,
    );

// 横向产品列表
class ProductVerticalWidget extends StatelessWidget {
  ProductVerticalWidget({this.some, Key key}) : super(key: key);

  Some some;

  Widget productImg(BuildContext context) => AspectRatio(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(distance),
          child: imager(context, some.avatar == null ? '' : some.avatar),
        ),
        aspectRatio: 4 / 3,
      );

  Widget productTxt(BuildContext context) => Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(some.txt),
          ),
          SizedBox(
            height: horizonT / 2,
          ),
          Container(
            width: double.infinity,
            child: customTitle(context, timestampFmt(some.add_time),
                Theme.of(context).accentColor, textS),
          )
        ],
      );

  Widget productMsg(BuildContext context) => AspectRatio(
      aspectRatio: 16 / 5,
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: horizon + distance, vertical: horizon),
          alignment: Alignment.centerLeft,
          child: productTxt(context)));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(flex: 3, child: productImg(context)),
          Expanded(flex: 7, child: productMsg(context))
        ],
      ),
    );
  }
}

Widget productVertical(Some some, [Key key]) => ProductVerticalWidget(
      key: key,
      some: some,
    );

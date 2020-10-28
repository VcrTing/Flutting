import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/common/util/time.dart';
import 'package:sona/model/some/some.dart';
import 'package:sona/widget/title.dart';

import 'imager.dart';

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

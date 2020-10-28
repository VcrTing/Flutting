import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sona/common/style/distance.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sona/screen/event/event.dart';
import 'package:sona/screen/product/product.dart';

class HomeItemWidget extends StatelessWidget {
  HomeItemWidget({Key key}) : super(key: key);

  List itemList = [
    {'icon': Icons.local_mall, 'txt': 'Product', 'page': ProductScreen()},
    {'icon': Icons.loyalty, 'txt': 'Category', 'page': EventScreen()},
    {'icon': Icons.event, 'txt': 'News', 'page': EventScreen()},
  ];

  Widget items(Map res) => Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizon / 2),
          child: Container(
              decoration: BoxDecoration(
                  // color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(horizonT / 2)),
              padding: EdgeInsets.symmetric(vertical: horizon),
              child: InkWell(
                child: Column(
                  children: [
                    Icon(
                      res['icon'],
                      size: iconL * 2,
                    ),
                    Text(res['txt'])
                  ],
                ),
                onTap: () {
                  Get.to(res['page']);
                },
              )),
        ),
        flex: 1,
      );

  List<Widget> itemPanel() => itemList.map((e) => items(e)).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizon / 2),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                ...itemPanel(),
              ]),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sona/common/style/distance.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sona/screen/event/event.dart';
import 'package:sona/screen/product/detail/productDetail.dart';
import 'package:sona/screen/product/product.dart';
import 'package:sona/service/data.dart';

class HomeItemWidget extends StatelessWidget {
  HomeItemWidget({Key key}) : super(key: key);

  List itemList = [
    {'icon': FontAwesomeIcons.home, 'txt': 'Product', 'page': ProductScreen()},
    {
      'icon': FontAwesomeIcons.apple,
      'txt': 'Category',
      'page': ProductDetailScreen(
        some: oneSome(0),
      )
    },
    {'icon': FontAwesomeIcons.adversal, 'txt': 'News', 'page': EventScreen()},
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
                    FaIcon(
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

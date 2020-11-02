import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/common/util/time.dart';
import 'package:sona/model/some/some.dart';
import 'package:sona/screen/product/detail/productDetail.dart';
import 'package:sona/service/data.dart';
import 'package:sona/widget/imager.dart';
import 'package:sona/widget/product.dart';
import 'package:sona/widget/space.dart';
import 'package:sona/widget/title.dart';

class HomeHotWidget extends StatefulWidget {
  HomeHotWidget({Key key}) : super(key: key);

  @override
  _HomeHotWidgetState createState() => _HomeHotWidgetState();
}

class _HomeHotWidgetState extends State<HomeHotWidget> {
  AnimationController _animateController;
  List<Some> someList = [];

  int productCount = 0;

  @override
  void initState() {
    super.initState();
  }

  Widget productEvery(Some some) => productWithTime(some);

  Widget fadeInUp(int timed, Widget child) => FadeInUp(
        manualTrigger: true,
        duration: Duration(milliseconds: timed),
        controller: (controller) => _animateController = controller,
        child: child,
      );

  Widget wrapperPanel(snapshot) => Wrap(
        spacing: 0,
        runSpacing: 0,
        children: [
          ...snapshot.data.map((Some some) {
            this.productCount += 1;
            return InkWell(
              child: fadeInUp(animateM + (animateS * this.productCount),
                  productEvery(some)),
              onTap: () {
                Get.to(ProductDetailScreen(
                  some: some,
                ));
              },
            );
          }).toList()
        ],
      );

  Widget productItem() {
    return FutureBuilder(
      future: loadSome(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          this.productCount = 0;
          return wrapperPanel(snapshot);
        }
        return defContent();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        fadeInUp(animateL, singleTitle(context, 'Recommend')),
        Container(
          padding: EdgeInsets.symmetric(horizontal: horizon / 2),
          margin: EdgeInsets.only(top: horizonT / 2),
          child: productItem(),
        )
      ],
    );
  }
}

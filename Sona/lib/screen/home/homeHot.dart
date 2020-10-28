import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/common/util/time.dart';
import 'package:sona/model/some/some.dart';
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

  @override
  void initState() {
    super.initState();
  }

  Widget productEvery(Some some) => productWithTime(some);

  Widget productItem() {
    return FutureBuilder(
      future: loadSome(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          int i = 0;
          return Wrap(
            spacing: 0,
            runSpacing: 0,
            children: [
              ...snapshot.data.map((Some some) {
                i += 1;
                return InkWell(
                  child: FadeInUp(
                    manualTrigger: true,
                    duration: Duration(milliseconds: animateM + (animateS * i)),
                    controller: (controller) => _animateController = controller,
                    child: productEvery(some),
                  ),
                  onTap: () {
                    print('打开沙发页面');
                  },
                );
              }).toList()
            ],
          );
        }
        return defContent();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInUp(
          manualTrigger: true,
          duration: Duration(milliseconds: animateL),
          controller: (controller) => _animateController = controller,
          child: singleTitle(context, 'Recommend'),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: horizon / 2),
          margin: EdgeInsets.only(top: horizonT / 2),
          child: productItem(),
        )
      ],
    );
  }
}

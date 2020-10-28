import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sona/model/profile/profile.dart';
import 'package:sona/model/some/some.dart';
import 'package:sona/screen/home/homeHot.dart';
import 'package:sona/screen/home/homeItem.dart';
import 'package:sona/screen/home/homeSwiper.dart';
import '../../common/style.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AnimationController _animateController;

  Widget items() => Container(
          // padding: EdgeInsets.symmetric(horizontal: horizon),
          child: FadeInUp(
        manualTrigger: true,
        duration: Duration(milliseconds: animateL),
        controller: (controller) => _animateController = controller,
        child: HomeItemWidget(),
      ));

  Widget swiper() => Container(
      height: 200,
      padding: EdgeInsets.symmetric(horizontal: horizon),
      child: FadeInUp(
          manualTrigger: true,
          duration: Duration(milliseconds: animateL),
          controller: (controller) => _animateController = controller,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(distance),
            child: HomeSwiperWidget(),
          )));

  Widget hot() => Container(
        child: HomeHotWidget(),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                swiper(),
                items(),
                SizedBox(
                  height: horizonT,
                ),
                hot(),
                SizedBox(
                  height: horizon * 4,
                ),
              ],
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/screen/profile/profileItem.dart';
import 'package:sona/screen/profile/profileMsg.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Widget topIcon() => SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: horizon),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.centerLeft,
          // child: Icon(Icons.menu),
          height: 1,
        ),
      );

  Widget profMsg() => Container(
        width: MediaQuery.of(context).size.width,
        child: ProfileMsgWidget(),
      );

  Widget profItem() => Container(
        child: ProfileItemWidget(),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Column(
              children: [profMsg(), profItem()],
            ),
          ),
          Positioned(
            top: 0,
            child: topIcon(),
          ),
        ],
      ),
    );
  }
}

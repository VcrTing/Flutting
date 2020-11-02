import 'package:flutter/material.dart';
import 'package:sona/common/style.dart';
import 'package:sona/widget/title.dart';

class LoginOtherWayWidget extends StatefulWidget {
  LoginOtherWayWidget({Key key}) : super(key: key);

  @override
  _LoginOtherWayWidgetState createState() => _LoginOtherWayWidgetState();
}

class _LoginOtherWayWidgetState extends State<LoginOtherWayWidget> {
  // WeChat
  Widget weChat() => InkWell(
        onTap: () {
          print('某种方式登录一');
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(horizon * 4),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.all(horizon),
            child: Icon(
              Icons.message_outlined,
              size: iconM,
            ),
          ),
        ),
      );

  // Google
  Widget gooGle() => InkWell(
        onTap: () {
          print('某种方式登录二');
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(horizon * 4),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.all(horizon),
            child: Icon(
              Icons.access_alarm,
              size: iconM,
            ),
          ),
        ),
      );

  List<Widget> otherWay() => <Widget>[
        weChat(),
        SizedBox(
          width: horizon,
        ),
        gooGle()
      ];

  Widget otherWayPanel() => Column(
        children: [
          Container(
            child: customTitle(
                context, 'other way', kGrey900, textS, FontWeight.w400),
          ),
          Padding(
            padding: EdgeInsets.only(top: horizon * 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: otherWay(),
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: horizon * 2),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width - (horizon * 4),
        child: otherWayPanel());
  }
}

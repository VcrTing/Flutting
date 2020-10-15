import 'package:animate_do/animate_do.dart';
import 'package:example/common/style/_contain.dart';
import 'package:example/screen/auth/verify.dart';
import 'package:example/widgets/brand/brand.dart';
import 'package:example/widgets/gradient/linear.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

double iconSize = horizon * 4;

// 共用 标题
Widget bannerTitle(BuildContext context, String txt) => Text(
      txt,
      style: Theme.of(context)
          .textTheme
          .headline4
          .copyWith(color: Theme.of(context).backgroundColor),
    );

// 共用 Icon
Widget bannerIcon(
        BuildContext context, Icon icon, double borderRadius, double padding) =>
    Container(
      margin: EdgeInsets.symmetric(vertical: horizon),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius)),
      child: icon,
    );

// 使用电话登录
class PhoneWay extends StatefulWidget {
  PhoneWay({Key key}) : super(key: key);

  @override
  _PhoneWayState createState() => _PhoneWayState();
}

class _PhoneWayState extends State<PhoneWay> {
  AnimationController animationController;

  Widget phoneWay() => Container(
        child: Column(
          children: [
            FadeInUp(
                duration: Duration(milliseconds: 500),
                controller: (controller) => animationController = controller,
                child: Column(
                  children: [
                    bannerTitle(context, '使用你的手机号码'),
                    bannerTitle(context, '注册/登入'),
                  ],
                )),
            GestureDetector(
                onTap: () => Get.to(VerifyCode()),
                child: FadeInUp(
                    delay: Duration(milliseconds: 500),
                    duration: Duration(milliseconds: 500),
                    controller: (controller) =>
                        animationController = controller,
                    child: bannerIcon(
                        context,
                        Icon(
                          Icons.phone_android,
                          size: iconSize + horizon,
                        ),
                        120,
                        distance)))
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return phoneWay();
  }
}

class OtherWay extends StatelessWidget {
  AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FadeInUp(
              duration: Duration(milliseconds: 500),
              controller: (controller) => animationController = controller,
              child: Column(
                children: [
                  bannerTitle(context, '注册/登入时连接'),
                  bannerTitle(context, 'Facebook 或 微信，以享'),
                  bannerTitle(context, '受快速登入'),
                ],
              )),
          FadeInUp(
              delay: Duration(milliseconds: 500),
              duration: Duration(milliseconds: 500),
              controller: (controller) => animationController = controller,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => print('Login by FaceBook.'),
                      child: bannerIcon(
                          context,
                          Icon(
                            Icons.feedback,
                            size: iconSize,
                          ),
                          horizon,
                          distance),
                    ),
                    SizedBox(
                      width: horizonL,
                      height: horizon,
                    ),
                    GestureDetector(
                      onTap: () => print('Login by WeChat.'),
                      child: bannerIcon(
                          context,
                          Icon(
                            Icons.phone_in_talk,
                            size: iconSize,
                          ),
                          horizon,
                          distance),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          title: brand(context, Theme.of(context).backgroundColor)),
      body: Container(
        color: Theme.of(context).primaryColorDark,
        child: Column(
          children: [
            linearLine(context),
            SizedBox(
              height: horizonL * 4,
            ),
            PhoneWay(),
            SizedBox(
              height: horizon * 2,
            ),
            OtherWay()
          ],
        ),
      ),
    );
  }
}

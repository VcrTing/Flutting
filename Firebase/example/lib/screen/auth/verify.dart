import 'dart:async';

import 'package:example/common/style/_contain.dart';
import 'package:example/screen/auth/wellcome.dart';
import 'package:example/widgets/brand/brand.dart';
import 'package:example/widgets/gradient/linear.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 共用 标题
Widget bannerTitle(BuildContext context, String txt) => Text(
      txt,
      style: Theme.of(context)
          .textTheme
          .headline3
          .copyWith(color: Theme.of(context).backgroundColor),
    );

// 重新发送验证码的局部刷新
class RefreshCode extends StatefulWidget {
  RefreshCode({Key key}) : super(key: key);

  @override
  _RefreshCodeState createState() => _RefreshCodeState();
}

class _RefreshCodeState extends State<RefreshCode> {
  int timeNum = 10;
  int defNum = 10;
  Timer numTimer;

  // 计算 倒计时
  void numCode() {
    numTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeNum < 1) {
          numTimer.cancel();
          numTimer = null;
        } else {
          timeNum -= 1;
        }
      });
    });
  }

  // 发送验证码
  void sendCode() {
    setState(() {
      timeNum = defNum;
    });
    numCode();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendCode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    numTimer?.cancel();
    numTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('刷新验证码页面重绘。');
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: horizon),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              if (timeNum < 1) {
                // 发送验证码
                print('发送验证码 =》');
                sendCode();
              }
            },
            child: Text('重新发送',
                style: TextStyle(
                    color: Theme.of(context)
                        .backgroundColor
                        .withOpacity(timeNum < 1 ? 0.7 : 0.4))),
          ),
          Text(
            timeNum < 1 ? '' : '（倒数${timeNum}秒）',
            style: TextStyle(
                color: Theme.of(context).backgroundColor.withOpacity(0.7)),
          )
        ],
      ),
    );
  }
}

// 填写验证码
class VerifyCode extends StatefulWidget {
  VerifyCode({Key key}) : super(key: key);

  @override
  _VerifyCodeState createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  String verify = '0000';
  final _formKey = GlobalKey<FormState>();
  final _verifyController = TextEditingController();

  GlobalKey _key = GlobalKey();

  Widget verifyForm() {
    Color inputColor = Theme.of(context).backgroundColor;
    Color primaryColor = Theme.of(context).primaryColor;
    TextStyle inputSub = Theme.of(context)
        .textTheme
        .bodyText1
        .copyWith(fontSize: 20, color: inputColor.withOpacity(0.5));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizon * 4),
      child: Form(
          key: _formKey,
          child: TextField(
            maxLength: 4,
            maxLines: 1,
            cursorColor: primaryColor.withOpacity(0.2),
            autofocus: true,
            controller: _verifyController,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                fillColor: inputColor.withOpacity(0.8),
                focusColor: inputColor.withOpacity(0.8),
                hoverColor: inputColor.withOpacity(0.8),
                hintText: '',
                hintStyle: inputSub,
                prefixStyle: inputSub,
                helperStyle: inputSub.copyWith(fontSize: 14),
                suffixStyle: inputSub,
                focusedBorder: null,
                enabledBorder: null,
                disabledBorder: null,
                errorBorder: null,
                focusedErrorBorder: null,
                border: null),
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: inputColor, fontSize: 24),
            onChanged: (String v) {
              String valid = v.length == 4 ? null : '验证码必须是四位数';
              if (valid == null) {
                if (verify == v) {
                  print('验证码验证成功');
                  Future.delayed(Duration(seconds: 1), () {
                    Get.to(WellComeScreen());
                  });
                }
              }
            },
            onSubmitted: (v) {
              print('Submit V = $v');
            },
          )),
    );
  }

  Widget verifyCode() => Container(
        padding: EdgeInsets.symmetric(horizontal: horizon),
        child: Column(
          children: [
            bannerTitle(context, '请输入'),
            bannerTitle(context, '我们透过短讯发出至'),
            bannerTitle(context, '+852 6398 9382' + ' 的'),
            bannerTitle(
              context,
              '一次性验证码：0000',
            ),
            SizedBox(
              height: horizonL,
            ),
            verifyForm(),
            RefreshCode(
              key: _key,
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    print('页面重绘');
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
            child: Column(children: [
              linearLine(context),
              SizedBox(
                height: horizonL * 2,
              ),
              verifyCode()
            ])));
  }
}

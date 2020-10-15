import 'package:example/screen/auth/login.dart';
import 'package:example/screen/auth/register.dart';
import 'package:example/screen/auth/verify.dart';
import 'package:example/screen/auth/wellcome.dart';
import 'package:example/screen/clause/clause.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopScreen extends StatefulWidget {
  ShopScreen({Key key}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text('跳转到《条款及细则》界面'),
            leading: Icon(Icons.pages),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print('《条款及细则》');
              Get.to(ClauseScreen());
            },
          ),
          ListTile(
            title: Text('跳转到《选择登录方式》界面'),
            leading: Icon(Icons.pages),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print('《选择登录方式》');
              Get.to(LoginScreen());
            },
          ),
          ListTile(
            title: Text('跳转到《验证码输入》界面'),
            leading: Icon(Icons.pages),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print('《验证码输入》');
              Get.to(VerifyCode());
            },
          ),
          ListTile(
            title: Text('跳转到《填写注册资料》界面'),
            leading: Icon(Icons.pages),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print('《填写注册资料》');
              Get.to(RegisterScreen());
            },
          ),
          ListTile(
            title: Text('跳转到《恭喜用户加入》界面'),
            leading: Icon(Icons.pages),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              print('《恭喜用户加入》');
              Get.to(WellComeScreen());
            },
          )
        ],
      ),
    );
  }
}

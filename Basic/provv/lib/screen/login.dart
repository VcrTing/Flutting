import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../model/profile.dart';
import '../provider/userProvider.dart';
import '../widget/loading.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String acc = 'vcrting@163.com';
  String pwd = 'ZT123zlt';

  Widget pageForm() {
    return AbsorbPointer(
        absorbing: true,
        ignoringSemantics: false,
        child: Form(
            child: Column(
          children: [
            FormBuilderTextField(
              readOnly: true,
              attribute: 'acc',
              decoration: InputDecoration(labelText: 'Account'),
              initialValue: acc,
              onChanged: (value) => acc = value,
              validators: [
                FormBuilderValidators.required(),
                FormBuilderValidators.maxLength(20),
                FormBuilderValidators.minLength(2),
                FormBuilderValidators.max(8),
                (v) {
                  // 精准验证
                  if (v == null && v.isEmpty) {
                    return 'Account shouldnt be empty.';
                  }
                }
              ],
            ),
            FormBuilderTextField(
              readOnly: true,
              attribute: 'pwd',
              decoration: InputDecoration(labelText: 'Password'),
              initialValue: pwd,
              onChanged: (value) => pwd = value,
              validators: [
                FormBuilderValidators.required(),
                FormBuilderValidators.maxLength(6),
                FormBuilderValidators.minLength(1),
                FormBuilderValidators.max(8),
                (v) {
                  // 精准验证
                  if (v == null && v.isEmpty) {
                    return 'Password shouldnt be empty.';
                  }
                }
              ],
            ),
          ],
        )));
  }

  Widget pageSubmit() => Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 80),
              width: double.infinity,
              child: Consumer<UserModel>(
                builder: (context, value, child) {
                  if (value.profile != null) {
                    return Container(
                      child: Text('登录成功！！'),
                    );
                  }
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: RaisedButton(
                      color: Theme.of(context).buttonColor,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      onPressed: () {
                        print('点击了登录。');
                        Profile pro = Profile();
                        pro.account = acc;
                        pro.password = pwd;
                        value.login(pro);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .accentTextTheme
                                .headline6
                                .fontSize,
                            color: Theme.of(context).primaryColorLight),
                      ),
                    ),
                  );
                },
              ))
        ],
      );

  Widget pageLogo() => Container(
      height: 120,
      child: Hero(
        tag: 'userCenter',
        child: ClipRRect(
          borderRadius: BorderRadius.circular(120),
          child: Image.asset(
            'assets/imgs/AVATAR.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ));
  Widget pageLayout() => Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Container(
            child: pageLogo(),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Text(
              'connto firebase...',
              style: TextStyle(
                  // color: Theme.of(context).primaryColorLight,
                  // fontWeight: FontWeight.bold
                  ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).backgroundColor,
            ),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: pageForm(),
          ),
          FutureBuilder(
              future: Provider.of<UserModel>(context).getProfileInShared(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data == null) {
                    return Container(
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: pageSubmit(),
                    );
                  } else {
                    // Navigator.of(context).pushNamed('/home', arguments: null);
                    bool autoLogin = Provider.of<UserModel>(context).autoLogin;
                    print('已有登录记录，是否允许自动登录：$autoLogin');
                    if (autoLogin) {
                      Provider.of<UserModel>(context)
                          .loginByUid(snapshot.data.id);
                    } else {
                      return Container(
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: pageSubmit(),
                      );
                    }
                  }
                }
                return Loading();
              }),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned(child: Text('')
              /*
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black, //.withOpacity(0),
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  'assets/imgs/SEA_1080_1366.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            */
              ),
          Positioned(
            child: pageLayout(),
          )
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import '../../service/factory/factory_model.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future getFuture;

  @override
  void initState() {
    super.initState();
  }

  List<Widget> loginTab() {
    return profiles
        .map((profile) => Container(
            width: double.infinity,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              overflow: Overflow.clip,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Image.network(profile['face']),
                      ),
                      Text(profile['name'])
                    ],
                  ),
                ),
                Container(
                  child: Image.network(profile['banner']),
                )
              ],
            )))
        .toList();
  }

  login() {
    print('LOGIN');
  }

  Widget view() {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Container(
              width: double.infinity,
              color: Colors.black,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: loginTab(),
                    ),
                  ),
                  SizedBox(
                    height: 130,
                  ),
                  RaisedButton(
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                    padding: EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                    child: AutoSizeText('登录',
                        style: GoogleFonts.getFont('Long Cang',
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w400))),
                    onPressed: () => login(),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  AutoSizeText('必须使用固定的账号',
                      style: GoogleFonts.getFont('Long Cang',
                          textStyle: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400)))
                ],
              )),
          Positioned(
            top: 0,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: GestureDetector(
                  onTap: () {
                    print('Back');
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FactoryModel>(builder: (context, value, child) {
      getFuture = value.getFuture();
      return FutureBuilder(
        future: getFuture,
        builder: (context, snapshot) {
          // if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            /*
              case ConnectionState.none:
                return Text('还没有开始网络请求');
              case ConnectionState.active:
                return Text('ConnectionState.active');
              */
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              return view();
            default:
              return Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      );
    });
  }
}

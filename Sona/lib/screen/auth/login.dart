import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/common/style/ui.dart';
import 'package:sona/screen/auth/login/loginForm.dart';
import 'package:sona/screen/auth/login/loginOtherWay.dart';
import 'package:sona/screen/auth/register/register.dart';
import 'package:sona/widget/animate.dart';
import 'package:sona/widget/form.dart';
import 'package:sona/widget/title.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;

  AnimationController _animateController;

  Widget fadeInUp(int timed, Widget child) => FadeInUp(
      manualTrigger: true,
      duration: Duration(milliseconds: timed),
      controller: (controller) => _animateController = controller,
      child: child);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget loginFormContent() => Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(horizon),
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: horizon + distance, vertical: horizon),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    LoginFormWidget(),
                    SizedBox(
                      height: horizon / 2,
                    )
                  ],
                )),
          ),
          SizedBox(
            height: horizon,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              otherWay(),
              Container(
                  child: customHeader(
                      context, '/', Colors.white.withOpacity(0.3), textM)),
              signUp()
            ],
          )
        ],
      );

  // Positioned(bottom: 0, child: otherWay())

  Widget loginForm() => Container(
        padding: EdgeInsets.symmetric(horizontal: horizon),
        child: loginFormContent(),
      );

  Widget img() => LottieAnimation(lottieCode: 'room');

  Widget signUp() => Container(
        // alignment: Alignment.topRight,
        // width: MediaQuery.of(context).size.width,
        child: InkWell(
            onTap: () {
              Get.to(RegisterScreen());
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(distance),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: horizon / 2, vertical: horizonT),
                child: customHeader(
                    context, 'Sign Up', Colors.white.withOpacity(0.7), textM),
              ),
            )),
      );

  Widget otherWay() => Container(
        padding: EdgeInsets.symmetric(horizontal: horizon / 2),
        child: customHeader(
            context, 'Other Way', Colors.white.withOpacity(0.7), textM),
      );

  Widget content() => Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          img(),
          Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.width / 1.2),
              child: loginForm()),
          // Positioned(child: signUp(), top: 0, right: 0),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: kTeal100,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: content(),
        ),
      ),
    );
  }

  Widget helpPanel() => Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              print('HELP');
            },
            child: Padding(
                padding: EdgeInsets.only(
                    top: horizon, bottom: horizon, left: horizon),
                child: Icon(
                  Icons.help,
                  size: iconS,
                )
                /*
                customHeader(
                  context,
                  'help?',
                  kGrey900, // Theme.of(context).accentColor,
                  textS,
                  FontWeight.w400),*/
                ),
          )
        ],
      ));
}

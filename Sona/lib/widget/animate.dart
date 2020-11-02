import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatefulWidget {
  String lottieCode;
  LottieAnimation({this.lottieCode, Key key}) : super(key: key);

  @override
  _LottieAnimationState createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;

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

  String lottieUri() {
    String res;
    switch (widget.lottieCode) {
      case 'room':
        res = 'lottie_room.json';
        break;
      case 'emptyBox':
        res = 'lottie_emptyBox.json';
        break;
      default:
        res = 'lottie_room.json';
    }
    return 'assets/pageFx/' + res;
  }

  Widget img() => Lottie.asset(
        lottieUri(),
        controller: _controller,
        onLoaded: (composition) {
          // Configure the AnimationController with the duration of the
          // Lottie file and start the animation.
          _controller
            ..duration = composition.duration
            ..forward();
        },
      );

  @override
  Widget build(BuildContext context) {
    return img();
  }
}

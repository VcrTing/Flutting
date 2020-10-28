import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/widget/title.dart';

Widget backPanel(BuildContext context, Widget barIcon, Widget barTxt) => Row(
      children: [
        InkWell(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: horizon / 2),
              child: barIcon),
          onTap: () {
            Get.back();
          },
        ),
        Container(child: barTxt)
      ],
    );

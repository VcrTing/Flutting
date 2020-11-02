import 'package:flutter/material.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/widget/title.dart';

class ProductShareWidget extends StatelessWidget {
  BuildContext _context;
  ProductShareWidget({Key key}) : super(key: key);

  Widget copyCode() => ClipRRect(
        borderRadius: BorderRadius.circular(distance),
        child: InkWell(
            onTap: () {
              print('分享口令');
            },
            child: Container(
              alignment: Alignment.center,
              padding:
                  EdgeInsets.symmetric(horizontal: horizon, vertical: horizon),
              child: Column(
                children: [
                  Icon(
                    Icons.copy_outlined,
                    size: iconM + iconM,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: distance),
                    child: customTitle(
                        _context, 'CODE', null, textS, FontWeight.bold),
                  )
                ],
              ),
            )),
      );

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizon, vertical: horizon),
      height: 150 + horizon,
      child: SafeArea(
        child: Row(
          children: [copyCode()],
        ),
      ),
    );
  }
}

Widget productShareWidget(BuildContext context) => InkWell(
    onTap: () {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ProductShareWidget();
        },
      ).then((e) {
        print('Share bottom sheet 已打开:');
        print(e);
      });
    },
    child: Icon(Icons.share));

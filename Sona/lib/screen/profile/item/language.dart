import 'package:flutter/material.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/widget/space.dart';

class ItemLanguageWidget extends StatelessWidget {
  const ItemLanguageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Container(
                child: Icon(Icons.language),
              ),
              Container(
                height: horizon,
              )
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
              padding: EdgeInsets.fromLTRB(horizon, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Language',
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(right: horizon / 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Icon(Icons.keyboard_arrow_right)],
                          ),
                        ),
                      )
                    ],
                  ),
                  paddingLine(context, horizon)
                ],
              )),
        ),
      ],
    );
  }
}

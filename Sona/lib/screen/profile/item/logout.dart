import 'package:flutter/material.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/widget/space.dart';

class ItemLogoutWidget extends StatelessWidget {
  const ItemLogoutWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Container(
                child: Icon(Icons.exit_to_app),
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
                          'Login Out',
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

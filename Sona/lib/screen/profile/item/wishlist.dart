import 'package:flutter/material.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/common/style/ui.dart';
import 'package:sona/widget/space.dart';

class ItemWishlistWidget extends StatelessWidget {
  const ItemWishlistWidget({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Container(
                child: Icon(Icons.favorite_border),
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
                          'My Wishlist',
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(right: horizon / 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: Text(
                                  '5items',
                                  style: TextStyle(color: kTeal100),
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_right)
                            ],
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

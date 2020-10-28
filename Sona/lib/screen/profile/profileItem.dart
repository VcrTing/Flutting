import 'package:flutter/material.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/screen/profile/item/dark.dart';
import 'package:sona/screen/profile/item/language.dart';
import 'package:sona/screen/profile/item/logout.dart';
import 'package:sona/widget/title.dart';

import 'item/wishlist.dart';

class ProfileItemWidget extends StatefulWidget {
  ProfileItemWidget({Key key}) : super(key: key);

  @override
  _ProfileItemWidgetState createState() => _ProfileItemWidgetState();
}

class _ProfileItemWidgetState extends State<ProfileItemWidget> {
  Widget profWishlist() => Padding(
        child: ItemWishlistWidget(),
        padding: EdgeInsets.only(bottom: horizon),
      );
  Widget profLanguage() => Padding(
        child: ItemLanguageWidget(),
        padding: EdgeInsets.only(bottom: horizon),
      );
  Widget profDark() => Padding(
        child: ItemDarkWidget(),
        padding: EdgeInsets.only(bottom: horizon),
      );
  Widget profLogout() => Padding(
        child: ItemLogoutWidget(),
        padding: EdgeInsets.only(bottom: horizon),
      );

  Widget itemEvery() => Container(
        padding: EdgeInsets.fromLTRB(
            horizonT + distance, horizon + distance, horizon, 0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [profWishlist(), profLanguage(), profDark(), profLogout()],
        ),
      );

  Widget itemTitle() => Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        child: singleTitle(
          context,
          'General Setting',
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [itemTitle(), itemEvery()],
    );
  }
}

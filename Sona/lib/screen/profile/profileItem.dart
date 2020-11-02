import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/screen/auth/login.dart';
import 'package:sona/screen/profile/item/dark.dart';
import 'package:sona/screen/profile/item/language.dart';
import 'package:sona/screen/profile/item/logout.dart';
import 'package:sona/screen/wishlist/wishlist.dart';
import 'package:sona/widget/title.dart';

import 'item/wishlist.dart';

class ProfileItemWidget extends StatefulWidget {
  ProfileItemWidget({Key key}) : super(key: key);

  @override
  _ProfileItemWidgetState createState() => _ProfileItemWidgetState();
}

class _ProfileItemWidgetState extends State<ProfileItemWidget> {
  Widget profWishlist() => InkWell(
        onTap: () {
          Get.to(WishListScreen());
        },
        child: Container(
          margin: EdgeInsets.only(top: horizon),
          child: ItemWishlistWidget(),
        ),
      );
  Widget profLanguage() => Container(
        margin: EdgeInsets.only(top: horizon),
        child: ItemLanguageWidget(),
      );
  Widget profDark() => Container(
        margin: EdgeInsets.only(top: horizon),
        child: ItemDarkWidget(),
      );

  Widget profLogout() => InkWell(
        onTap: () {
          Get.to(LoginScreen());
        },
        child: Container(
          margin: EdgeInsets.only(top: horizon),
          child: ItemLogoutWidget(),
        ),
      );

  Widget itemEvery() => Container(
        padding: EdgeInsets.fromLTRB(horizonT + distance, 0, horizon, 0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [profWishlist(), profLanguage(), profDark(), profLogout()],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return itemEvery();
  }
}

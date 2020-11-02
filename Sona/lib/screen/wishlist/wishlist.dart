import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/common/util/time.dart';
import 'package:sona/model/some/some.dart';
import 'package:sona/service/data.dart';
import 'package:sona/widget/imager.dart';
import 'package:sona/widget/product.dart';
import 'package:sona/widget/space.dart';
import 'package:sona/widget/title.dart';

class WishListScreen extends StatefulWidget {
  WishListScreen({Key key}) : super(key: key);

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  Widget title() => Padding(
      padding: EdgeInsets.only(left: horizon, top: horizon * 2),
      child: largeTitle(context, 'My Wishlist'));

  Widget numedTitle() => Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: horizon, vertical: horizon),
        child: customTitle(
            context, '0 items', Theme.of(context).accentColor, textS),
      );

  Widget statusOption() => ClipRRect(
      borderRadius: BorderRadius.circular(horizon * 2),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(horizon * 2),
            border: Border.all(
                color: Theme.of(context).buttonTheme.colorScheme.onSecondary,
                width: 2,
                style: BorderStyle.solid)),
        child: Icon(
          Icons.remove,
          size: iconS,
        ),
      ));

  Widget productEvery(Some some) => productVertical(some);

  Widget wishlistEvery(Map e) => Container(
        margin: EdgeInsets.only(bottom: horizon),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  padding:
                      EdgeInsets.only(left: horizon, right: horizon + distance),
                  alignment: Alignment.centerLeft,
                  child: AspectRatio(
                      aspectRatio: 1,
                      child: InkWell(
                          onTap: () {
                            print('移除出 清单');
                          },
                          child: statusOption())),
                )),
            Expanded(
              flex: 6,
              child: productEvery(e['product']),
            )
          ],
        ),
      );

  Widget wishlistProduct() => FutureBuilder(
        future: loadWishlist(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List res = snapshot.data.map((e) {
              return wishlistEvery(e);
            }).toList();

            return Column(children: [...res]);
          }
          return defContent();
        },
      );

  Widget content() => Container(
      margin: EdgeInsets.only(top: horizon),
      height: MediaQuery.of(context).size.height - 192 - horizon,
      child: SingleChildScrollView(
        child: wishlistProduct(),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: backPanel(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: [title(), numedTitle(), content()],
          ),
        ),
      ),
    );
  }

  Widget backPanel() => Container(
      margin: EdgeInsets.all(horizon),
      decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(horizon * 3)),
      child: IconButton(
        color: Colors.white,
        icon: Container(
          padding: EdgeInsets.only(left: (horizonT / 2) + distance),
          child: Icon(
            Icons.arrow_back_ios,
            // size: iconL,
          ),
        ),
        onPressed: () {
          Get.back();
        },
      ));
}

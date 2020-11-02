import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sona/common/style.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/model/some/some.dart';
import 'package:sona/screen/product/detail/productAddToCart.dart';
import 'package:sona/screen/product/detail/productDescription.dart';
import 'package:sona/screen/product/detail/productShare.dart';
import 'package:sona/screen/product/detail/productWishlist.dart';
import 'package:sona/widget/title.dart';

import 'productGalery.dart';

class ProductDetailScreen extends StatefulWidget {
  Some some;
  ProductDetailScreen({this.some, Key key}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Widget productGalery() => Container(
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height - 400 - horizon),
      color: Theme.of(context).scaffoldBackgroundColor,
      width: double.infinity,
      child: ProductGaleryWidget(imgs: ['', '', '']));

  Widget productTitle() => Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: distance),
        child: customTitle(
            context, widget.some.txt, Theme.of(context).accentColor, textL),
      );

  Widget productPrice() => Container(
        child: Row(
          children: [
            Icon(Icons.money),
            customHeader(context, widget.some.price, null, textS)
          ],
        ),
        width: double.infinity,
        margin: EdgeInsets.only(bottom: horizon, top: horizonT / 2),
      );

  Widget productDetail() => Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          productTitle(),
          productPrice(),
          ProductAddToCartWidget(),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: horizon),
            padding: EdgeInsets.only(top: horizon + distance, bottom: horizonT),
            child: customTitle(context, 'Description', null, textM),
          ),
          ProductDescriptionWidget()
        ],
      ));

  Widget productContent() => Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(horizontal: horizon, vertical: horizon),
        child: Column(
          children: [productDetail()],
        ),
      );

  Widget content() => Column(
        children: [productGalery(), productContent()],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              child: content(),
            ),
            Positioned(child: topBar())
          ],
        ),
      ),
    );
  }

  Widget backPanel() => Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(horizontal: horizonT),
        child: InkWell(
          child: Icon(Icons.close),
          onTap: () {
            Get.back();
          },
        ),
      );

  Widget optionPanel() => Align(
        alignment: Alignment.topRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ProductWishlistWidget(),
            productShareWidget(context),
            SizedBox(
              width: horizonT,
            ),
          ],
        ),
      );

  Widget topBar() => Container(
        height: 120,
        child: SafeArea(
          child: Row(
            children: [
              Expanded(child: backPanel()),
              Expanded(child: optionPanel())
            ],
          ),
        ),
      );
}

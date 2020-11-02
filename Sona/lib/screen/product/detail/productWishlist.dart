import 'package:flutter/material.dart';
import 'package:sona/common/style.dart';

class ProductWishlistWidget extends StatefulWidget {
  ProductWishlistWidget({Key key}) : super(key: key);

  @override
  _ProductWishlistWidgetState createState() => _ProductWishlistWidgetState();
}

class _ProductWishlistWidgetState extends State<ProductWishlistWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('加入 Wishlist');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizon),
        child: Icon(Icons.favorite_border),
      ),
    );
  }
}

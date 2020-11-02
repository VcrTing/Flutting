import 'package:flutter/material.dart';
import 'package:sona/common/style.dart';
import 'package:sona/widget/title.dart';

class ProductDescriptionWidget extends StatelessWidget {
  String msg = 'Material icons are delightful, beautifully crafted symbols for common actions and items. ' +
      'Download on desktop to use them in your digital products for Android, iOS, and web.' +
      'Download on desktop to use them in your digital products for Android, iOS, and web.' +
      'Download on desktop to use them in your digital products for Android, iOS, and web.' +
      'Download on desktop to use them in your digital products for Android, iOS, and web.' +
      'Download on desktop to use them in your digital products for Android, iOS, and web.' +
      'Download on desktop to use them in your digital products for Android, iOS, and web.' +
      'Download on desktop to use them in your digital products for Android, iOS, and web.' +
      'Download on desktop to use them in your digital products for Android, iOS, and web.' +
      'Download on desktop to use them in your digital products for Android, iOS, and web.' +
      'Download on desktop to use them in your digital products for Android, iOS, and web.' +
      'Download on desktop to use them in your digital products for Android, iOS, and web.'
          'Download on desktop to use them in your digital products for Android, iOS, and web.';

  ProductDescriptionWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        padding: EdgeInsets.symmetric(horizontal: horizon),
        child: SingleChildScrollView(
          child: customTitle(context, '$msg', null, textS),
        ));
  }
}

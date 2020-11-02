import 'package:flutter/material.dart';
import 'package:sona/widget/imager.dart';
import 'package:sona/widget/space.dart';

class ProductGaleryWidget extends StatelessWidget {
  List imgs;
  BuildContext _context;
  ProductGaleryWidget({this.imgs, Key key}) : super(key: key);

  Widget imgEvery(String uri) => imager(_context, uri);

  List<Widget> imgList() => this.imgs.map((e) {
        return GestureDetector(
          onTap: () {
            print('放大图片到全屏');
          },
          child: imgEvery(e),
        );
      }).toList();

  Widget galery() => Stack(
        children: [...imgList()],
      );

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Container(
      child: galery(),
    );
  }
}

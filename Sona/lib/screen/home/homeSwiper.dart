import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sona/widget/imager.dart';

class HomeSwiperWidget extends StatelessWidget {
  const HomeSwiperWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return imager(context, '');
      },
      itemCount: 3,
      // viewportFraction: 0.8,
      pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
              color: Colors.black26, activeColor: Colors.white)),
      // control: SwiperControl(),
      autoplay: true,
      scrollDirection: Axis.horizontal,
      onTap: (i) => print('点击了第 $i 个'),
      // layout: SwiperLayout.DEFAULT,
    );
  }
}

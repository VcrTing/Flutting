import 'package:flutter/material.dart';
import 'package:sona/common/style/distance.dart';
import 'package:sona/model/profile/profile.dart';
import 'package:sona/widget/imager.dart';
import 'package:sona/widget/title.dart';

class ProfileMsgWidget extends StatelessWidget {
  ProfileMsgWidget({Key key}) : super(key: key);
  BuildContext _context;
  Profile prof;

  Widget profBg() => Stack(
        children: [
          Container(
            height: horizon * 12,
            child: imager(_context, ''),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(_context).size.width,
              margin: EdgeInsets.symmetric(vertical: horizon),
              child: centerTitle(_context, 'Setting'),
            ),
          )
        ],
      );

  Widget profAccount() => Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Icon(Icons.phone_android),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: horizon),
              alignment: Alignment.centerLeft,
              child: Text(
                '+86 13576639986',
              ),
            ),
          )
        ],
      );

  Widget profFace() => Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: distance),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(horizonT * 10),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: imager(_context, ''),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: horizon),
              child: Text(
                'Qiong',
                style: TextStyle(fontSize: textM),
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Column(
      children: [
        profBg(),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
              horizontal: horizonT + distance, vertical: horizon * 2),
          child: Column(
            children: [
              profFace(),
              SizedBox(
                height: horizon,
              ),
              profAccount()
            ],
          ),
        )
      ],
    );
  }
}

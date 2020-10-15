import 'package:example/common/style.dart';
import 'package:flutter/material.dart';

Widget brand(BuildContext context, Color txtColor) => Container(
      margin: EdgeInsets.only(top: distance),
      padding: EdgeInsets.symmetric(horizontal: distance, vertical: horizon),
      child: Column(
        children: [
          Text(
            'LE SOIN',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: txtColor, fontSize: 16),
          ),
          Text(
            'HEXAGONAL',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: txtColor, fontSize: 18, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );

Widget brandAndLogo(BuildContext context, Color txtColor,
        [double ratio = 0.8]) =>
    Container(
      margin: EdgeInsets.only(top: distance),
      padding: EdgeInsets.symmetric(horizontal: distance, vertical: horizon),
      child: Column(
        children: [
          Container(
            width: 78 * ratio,
            height: 78 * ratio,
            child: Icon(
              Icons.account_balance,
              size: 60 * ratio,
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(horizon / 2)),
          ),
          SizedBox(
            height: (horizon / 2) * ratio + 2,
          ),
          Text(
            'LE SOIN',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: txtColor, fontSize: 25 * ratio, letterSpacing: 2),
          ),
          Text(
            'HEXAGONAL',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: txtColor,
                  fontSize: 30 * ratio,
                  // fontWeight: FontWeight.w500
                ),
          ),
          SizedBox(
            height: (horizon / 2) * ratio,
          ),
          Text(
            'PARIS',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: txtColor, fontSize: 12 * ratio, letterSpacing: 8),
          ),
        ],
      ),
    );

import 'package:flutter/material.dart';

Widget defImage(BuildContext context) => Container(
      color: Theme.of(context).scaffoldBackgroundColor,
    );

Widget imager(BuildContext context, String uri) => uri == ''
    ? defImage(context)
    : Image.network(
        uri,
        fit: BoxFit.cover,
      );

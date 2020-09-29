import 'dart:io' show Platform;
import 'dart:convert' as convert;
import 'dart:math';
import 'package:flutter/material.dart';

/// check if the environment is web
const bool kIsWeb = identical(0, 0.0);

/// check tablet screen
bool isTablet(BoxConstraints constraints) {
  if (kIsWeb) {
    return true;
  }

  if (constraints.maxWidth > (constraints.maxHeight * 2)) {
    return true;
  }

  if (Platform.isWindows || Platform.isMacOS) {
    return false;
  }

  var size = constraints;
  var diagonal =
      sqrt((size.maxWidth * size.maxWidth) + (size.maxHeight * size.maxHeight));
  var isTablet = diagonal > 1100.0;
  return isTablet;
}

// Other Tool
class Tools {
  /// check tablet screen
  // static

  /// cache avatar for the chat
  /*
  static getCachedAvatar(String avatarUrl) {
    return CachedNetworkImage(
      imageUrl: avatarUrl,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
  */
}

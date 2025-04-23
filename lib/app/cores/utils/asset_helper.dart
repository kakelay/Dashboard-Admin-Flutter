import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AssetHelper {
  static String imagePath(String assetName) {
    const assetImagesPath = 'assets/images';
    final path = '$assetImagesPath/$assetName';
    debugPrint(path);
    return path;
  }

  static String iconPath(String assetName) {
    const iconsPath = 'assets/icons';
    final path = '$iconsPath/$assetName';
    debugPrint(path);
    return path;
  }

  static String SvgAsset(String assetName) {
    const svgsPath = 'assets/svgs';
    final path = '$svgsPath/$assetName';
    debugPrint(path);
    return path;
  }

  static String lottiPath(String assetName) {
    const lottiPath = 'assets/lotties';
    final path = '$lottiPath/$assetName';
    debugPrint(path);
    return path;
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    final data = await rootBundle.load(path);
    final codec = await instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    final fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static TextTheme getTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }
}

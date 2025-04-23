import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget BaseShimmerWidget({
  required Widget child,
  Color? baseColor,
  Color? highlightColor,
}) {
  baseColor ??= Colors.grey.shade300;
  highlightColor ??= Colors.grey.shade100;

  return Shimmer.fromColors(
    baseColor: baseColor,
    highlightColor: highlightColor,
    child: child,
  );
}

import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Text TextWidget(
  String text, {
  double fontSize = 14,
  FontWeight weight = FontWeight.normal,
  Color? color,
  TextAlign align = TextAlign.left,
  int? maxLines,
  TextOverflow? overflow,
  TextDecoration? decoration,
  double? letterSpacing,
  double? height,
  FontStyle? fontStyle,
  String? fontFamily,
}) {
  color ??= AppColors.black1D1D23;
  return Text(
    text,
    textAlign: align,
    maxLines: maxLines,
    overflow: overflow,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: weight,
      decoration: decoration,
      letterSpacing: letterSpacing,
      height: height,
      fontStyle: fontStyle,
      fontFamily: fontFamily,
    ),
  );
}

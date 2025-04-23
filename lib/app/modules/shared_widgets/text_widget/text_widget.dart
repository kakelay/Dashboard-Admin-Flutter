import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:flutter/material.dart';

Text TextWidget(
  String text, {
  double fontSize = 14,
  FontWeight weight = FontWeight.normal,
  Color? color,
  TextAlign align = TextAlign.left,
}) {
  color ??= AppColors.black1D1D23;
  return Text(
    text,
    textAlign: align,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: weight,
    ),
  );
}

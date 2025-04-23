import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:flutter/material.dart';

class ContainerDecoration {
  static BoxDecoration shadow({
    double borderRadius = 10,
    Color? fillColor,
  }) {
    fillColor ??= AppColors.white;
    return BoxDecoration(
      color: fillColor,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 1), // changes position of shadow
        ),
      ],
    );
  }

  static BoxDecoration rounded({
    double borderRadius = 10,
    double borderWidth = 1,
    Color? borderColor,
    Color? fillColor,
  }) {
    borderColor ??= AppColors.grey16202E;
    fillColor ??= AppColors.white;
    return BoxDecoration(
      color: fillColor,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: borderColor,
        width: borderWidth,
      ),
    );
  }
}

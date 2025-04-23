import 'package:admin_dashboard/app/cores/themes/app_style.dart';
import 'package:admin_dashboard/app/cores/values/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget BottomWrapper({
  required Widget child,
  bool isBoxShadow = true,
  bool isInnerBoxShadow = false,
  Color? backgrounndColor,
}) {
  backgrounndColor ??= AppColors.appColor;
  return Builder(
    builder: (context) {
      final keyboardBottom = MediaQuery.of(context).viewInsets.bottom;
      final paddingBottom = MediaQuery.of(context).padding.bottom + 10;
      return DecoratedBox(
        decoration: BoxDecoration(
          // border: Border(
          //   top: BorderSide(width: 0.5, color: CustomColor.gray.withOpacity(.4)),
          // ),
          color: backgrounndColor,
          boxShadow: isBoxShadow
              ? [
                  BoxShadow(
                    blurRadius: 3,
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.02)
                        : Colors.black.withOpacity(0.05),
                    offset: const Offset(0, -5),
                    spreadRadius: 1,
                  ),
                ]
              : isInnerBoxShadow
                  ? null
                  : null,
        ),
        child: Container(
          margin: EdgeInsets.only(
            top: AppStyle.SPACING_16,
            bottom: keyboardBottom + paddingBottom,
            left: AppStyle.SPACING_16,
            right: AppStyle.SPACING_16,
          ),
          child: child,
        ),
      );
    },
  );
}

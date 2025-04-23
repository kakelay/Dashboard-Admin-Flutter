import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:admin_dashboard/app/cores/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
 

Widget AppbarBackButton({
  bool useArrowLeftButton = true,
  Color? iconColor = AppColors.black262626,
  Function()? onTap,
}) {
  return GestureDetector(
    onTap: () {
      if (onTap == null) {
        Get.back();
      } else {
        onTap();
      }
    },
    child: SvgPicture.asset(
      //testing svg
      useArrowLeftButton ? SvgAsset.EditFill : SvgAsset.EditFill,
      fit: BoxFit.scaleDown,
      color: iconColor,
    ),
  );
}

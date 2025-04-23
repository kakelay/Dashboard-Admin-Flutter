import 'package:admin_dashboard/app/cores/themes/app_style.dart';
import 'package:admin_dashboard/app/cores/utils/asset_helper.dart';
import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../text_widget/text_widget.dart';

Widget IconTextWidget({
  required String svgIcon,
  required String text,
  Color? textColor,
  Color? iconColor,
  double? iconSize,
  double fontSize = 14,
  FontWeight textFontWeight = FontWeight.normal,
  CrossAxisAlignment verticalAlignment = CrossAxisAlignment.start,
}) {
  textColor ??= AppColors.white;
  iconColor ??= AppColors.green27AE60;
  return Row(
    crossAxisAlignment: verticalAlignment,
    children: [
      SvgPicture.asset(
        AssetHelper.SvgAsset(svgIcon),
        color: iconColor,
        width: iconSize,
        height: iconSize,
      ),
      const SizedBox(width: AppStyle.SPACING_8),
      Expanded(
        child: TextWidget(
          text,
          color: textColor,
          fontSize: fontSize,
          weight: textFontWeight,
        ),
      ),
    ],
  );
}

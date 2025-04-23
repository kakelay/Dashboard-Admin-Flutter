import 'package:admin_dashboard/app/cores/themes/app_style.dart';
import 'package:admin_dashboard/app/cores/utils/asset_helper.dart';
import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:admin_dashboard/app/modules/shared_widgets/text_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget SettingMenuItem({
  required String text,
  required String svgIcon,
  Color? iconColor,
  Widget? trailingWidget,
  Function? onTap,
  double iconSize = 24,
  double verticalPadding = AppStyle.SPACING_12,
}) {
  trailingWidget ??= const Icon(
    Icons.chevron_right,
    color: AppColors.grey16202E,
  );
  return GestureDetector(
    onTap: () {
      if (onTap != null) onTap();
    },
    child: Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: AppStyle.SPACING_12,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AssetHelper.SvgAsset(svgIcon),
            color: iconColor ?? AppColors.grey16202E,
            width: iconSize,
            height: iconSize,
          ),
          const SizedBox(width: AppStyle.SPACING_16),
          Expanded(
            child: TextWidget(
              text,
              fontSize: 16,
              weight: FontWeight.w600,
              color: AppColors.black1D1D23,
            ),
          ),
          const SizedBox(width: AppStyle.SPACING_16),
          trailingWidget,
        ],
      ),
    ),
  );
}

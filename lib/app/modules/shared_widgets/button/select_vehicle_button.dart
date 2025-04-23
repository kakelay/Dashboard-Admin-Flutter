import 'package:admin_dashboard/app/cores/themes/app_style.dart';
import 'package:admin_dashboard/app/cores/themes/container_decoration.dart';
import 'package:admin_dashboard/app/cores/utils/asset_helper.dart';
import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../text_widget/text_widget.dart';

Widget SelectVehicleButton({
  required String id,
  required String text,
  required String iconName,
  required String selectedIconName,
  required bool isSelected,
  Function? onTap,
}) {
  return GestureDetector(
    onTap: () {
      if (onTap != null) onTap();
    },
    child: Container(
      alignment: Alignment.center,
      decoration: ContainerDecoration.rounded(
        borderColor: isSelected ? AppColors.green27AE60 : AppColors.grey16202E,
      ),
      padding: const EdgeInsets.all(AppStyle.SPACING_16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetHelper.SvgAsset(
              isSelected ? selectedIconName : iconName,
            ),
            color: isSelected ? AppColors.green27AE60 : AppColors.grey16202E,
            width: 40,
          ),
          const SizedBox(height: AppStyle.SPACING_8),
          TextWidget(
            text,
            color: isSelected ? AppColors.green27AE60 : AppColors.black1D1D23,
            weight: FontWeight.w600,
          ),
        ],
      ),
    ),
  );
}

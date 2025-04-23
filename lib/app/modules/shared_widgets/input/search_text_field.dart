import 'package:admin_dashboard/app/cores/themes/app_style.dart';
import 'package:admin_dashboard/app/cores/values/app_strings.dart';
import 'package:admin_dashboard/app/modules/shared_widgets/input/custom_text_field.dart';
import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget SearchTextField({
  required TextEditingController controller,
  required VoidCallback onClearTextTap,
  required String hintText,
  Function(String)? onValueChange,
}) {
  return CustomTextField(
    controller: controller,
    suffixIcon: controller.text.isNotEmpty
        ? IconButton(
            isSelected: true,
            onPressed: onClearTextTap,
            icon: const Icon(
              Icons.close,
              color: AppColors.appColor,
            ),
          )
        : null,
    borderColor: AppColors.greyEBEFF5,
    onValueChange: onValueChange,
    hintText: hintText,
    verticalContendPadding: AppStyle.SPACING_14,
    fillColor: AppColors.white,
    textColor: AppColors.grey687A93,
    prefixIcon: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyle.SPACING_12,
      ),
      child: SvgPicture.asset(
        SvgAsset.search,
      ),
    ),
    borderRadius: AppStyle.SPACING_8,
  );
}

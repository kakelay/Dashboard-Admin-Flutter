import 'package:admin_dashboard/app/cores/themes/app_style.dart';
import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:admin_dashboard/app/modules/shared_widgets/input/custom_text_field.dart';
import 'package:admin_dashboard/app/modules/shared_widgets/text_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


Widget TextfieldWithTitleOnTop({
  required String title,
  String? hintText,
  TextEditingController? controller,
  Function(String)? onChange,
  double topPadding = 12,
  Widget? suffixIcon,
  Widget? prefixIcon,
  int maxLine = 1,
  int minLine = 1,
  bool obscureText = false,
  TextStyle? suffixStyle,
  Color? borderColor,
  String? initialValue,
  TextInputType? inputType,
  String? Function(String?)? validator,
  bool isRequiredField = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Gap(topPadding),
      Row(
        children: [
          TextWidget(title),
          if (isRequiredField) TextWidget(' *', color: AppColors.redF33641),
        ],
      ),
      Gap(6),
      CustomTextField(
        inputType: inputType,
        initialValue: initialValue,
        controller: controller,
        prefixIcon: prefixIcon,
        suffixStyle: suffixStyle,
        obscureText: obscureText,
        borderRadius: AppStyle.SPACING_8,
        verticalContendPadding: AppStyle.SPACING_14,
        borderColor: borderColor,
        hintText: hintText,
        suffixIcon: suffixIcon,
        maxLine: maxLine,
        minLine: minLine,
        onValueChange: onChange,
        validator: validator,
      ),
    ],
  );
}

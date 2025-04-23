import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:flutter/material.dart';
import '../text_widget/text_widget.dart';


Widget TextButtonWithIcon({
  required String text,
  Widget? leadingIcon,
  Widget? trailingIcon,
  required Function() onTap,
  CrossAxisAlignment? crossAxisAlignment,
  Color? textColor,
  FontWeight textFontWeight = FontWeight.normal,
}) {
  textColor ??= AppColors.green27AE60;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (leadingIcon != null) leadingIcon,
          const SizedBox(width: 5),
          TextWidget(
            text,
            color: textColor,
          ),
          const SizedBox(width: 5),
          if (trailingIcon != null) trailingIcon,
        ],
      ),
    ),
  );
}

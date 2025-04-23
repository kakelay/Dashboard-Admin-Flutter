import 'package:admin_dashboard/app/cores/themes/app_style.dart';
import 'package:admin_dashboard/app/modules/shared_widgets/text_widget/text_widget.dart';
import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:flutter/material.dart';

Widget RoundedButton({
  Key? key,
  required String text,
  Widget? leadingIcon,
  Widget? trailingIcon,
  Function? onPress,
  Color? borderColor,
  Color? fillColor,
  Color? textColor,
  double verticalPadding = AppStyle.SPACING_8,
  double margin = 0,
  double? height = AppStyle.BUTTON_HEIGHT,
  bool isDisable = false,
  bool isDisableTextOnly = false,
  bool showLoadingOverlay = false,
  double borderRadius = 10,
  FontWeight weight = FontWeight.w600,
  double? width,
  double? bottomMargin,
}) {
  borderColor ??= Colors.transparent;
  fillColor ??= AppColors.white;
  textColor ??= AppColors.appColor;

  return GestureDetector(
    key: key,
    onTap: () {
      if (onPress != null) {
        if (!isDisable) onPress();
      }
    },
    child: Stack(
      children: [
        Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          margin: bottomMargin == null
              ? EdgeInsets.all(margin)
              : EdgeInsets.only(bottom: bottomMargin),
          decoration: BoxDecoration(
            border: Border.all(
              color: isDisable ? Colors.transparent : borderColor,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
            color: fillColor == Colors.transparent
                ? fillColor
                : fillColor.withOpacity(isDisable ? 0.3 : 1),
          ),
          child: showLoadingOverlay
              ? const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    color: AppColors.white,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (leadingIcon != null) leadingIcon,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppStyle.SPACING_8,
                      ),
                      child: TextWidget(
                        text,
                        fontSize: 16,
                        color:
                            textColor.withOpacity(isDisableTextOnly ? .3 : 1),
                        weight: weight,
                      ),
                    ),
                    if (trailingIcon != null) trailingIcon,
                  ],
                ),
        ),
      ],
    ),
  );
}

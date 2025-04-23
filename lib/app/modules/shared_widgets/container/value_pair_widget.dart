// ignore_for_file: non_constant_identifier_names

import 'package:admin_dashboard/app/cores/themes/app_style.dart';
import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:flutter/material.dart';

 
import '../text_widget/text_widget.dart';

Widget ValuePairWidget({
  required String key,
  required String value,
  Widget? subTrailingWidget,
  bool divider = true,
  double spacing = AppStyle.SPACING_12,
  String? phone,
}) {
  if (value.isEmpty) {
    return Container(
      height: 0,
    );
  }
  return Container(
    // height: AppStyle.BUTTON_HEIGHT,
    margin: EdgeInsets.only(top: spacing),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(key, color: AppColors.green27AE60),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextWidget(
                    value,
                    align: TextAlign.right,
                  ),
                  if (phone != null)
                    TextWidget(
                      phone,
                      align: TextAlign.right,
                      color: AppColors.green27AE60,
                    ),
                ],
              ),
            ),
          ],
        ),
        subTrailingWidget ?? Container(height: 0),
        if (divider) ...[
          SizedBox(height: spacing),
          const Divider(
            color: AppColors.grey16202E,
          ),
        ],
      ],
    ),
  );
}

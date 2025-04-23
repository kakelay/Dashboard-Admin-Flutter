import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:flutter/material.dart';

Widget doubleButtonRowWidget({
  required String firstText,
  IconData? firstIcon,
  required String secondText,
  IconData? secondIcon,
  required EdgeInsets padding,
  Color? firstTextColor,
  required Color secondTextColor,
  Color? backgroundColorText1 = AppColors.appColor,
  Color? backgroundColorText2 = AppColors.appColor,
  double? height = 60,
}) {
  return Padding(
    padding: padding,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: _buildContainer(
              text: firstText,
              icon: firstIcon,
              textColor: firstTextColor,
              backgroundColor: backgroundColorText1,
              height: height),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildContainer(
            text: secondText,
            icon: secondIcon,
            textColor: secondTextColor,
            backgroundColor: backgroundColorText2,
            height: height,
          ),
        ),
      ],
    ),
  );
}

Widget _buildContainer({
  required String text,
  IconData? icon,
  Color? textColor,
  Color? backgroundColor,
  double? height = 60,
}) {
  return Container(
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    height: height,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    ),
  );
}

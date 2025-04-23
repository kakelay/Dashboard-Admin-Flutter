import 'package:admin_dashboard/app/cores/themes/app_style.dart';
import 'package:admin_dashboard/app/cores/themes/container_decoration.dart';
import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

 
Widget InversBorderContainer({
  required double areaWidth,
  required double areaHeight,
  Decoration? frameDecoration,
}) {
  frameDecoration ??= ContainerDecoration.rounded(
    borderRadius: AppStyle.CONTAINER_RADIUS,
    borderColor: AppColors.grey16202E,
    fillColor: Colors.transparent,
    borderWidth: 3,
  );
  return ClipPath(
    clipper: CustomCornerClipPath(areaHeight: areaHeight, areaWidth: areaWidth),
    child: Container(
      height: Get.height, //based on your need
      width: Get.width,
      color: Colors.black.withOpacity(.7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: areaHeight + 4,
            width: areaWidth + 4,
            child: Container(
              decoration: frameDecoration,
            ),
          ),
        ],
      ),
    ),
  );
}

class CustomCornerClipPath extends CustomClipper<Path> {
  CustomCornerClipPath({
    required this.areaWidth,
    required this.areaHeight,
    this.cornerR = 16.0,
  });
  final double cornerR;
  final double areaWidth;
  final double areaHeight;
  @override
  Path getClip(Size size) {
    final vSpace = (size.height - areaHeight) / 2;
    final hSpace = (size.width - areaWidth) / 2;

    return Path()
      ..lineTo(size.width, 0) //250,0
      ..lineTo(size.width, size.height) // 250,400
      ..lineTo(size.width - areaWidth - hSpace, size.height) // 50,400
      ..lineTo(size.width - areaWidth - hSpace, size.height - vSpace - cornerR)
      ..arcToPoint(
        Offset(
          size.width - areaWidth - hSpace + cornerR,
          size.height - vSpace,
        ),
        radius: Radius.circular(cornerR),
        clockwise: false,
      )
      ..lineTo(size.width - hSpace - cornerR, size.height - vSpace)
      ..arcToPoint(
        Offset(
          size.width - hSpace,
          size.height - vSpace - cornerR,
        ),
        radius: Radius.circular(cornerR),
        clockwise: false,
      )
      ..lineTo(
        size.width - hSpace,
        size.height - vSpace - areaHeight + cornerR,
      ) // (200,100+20)
      ..arcToPoint(
        Offset(
          size.width - hSpace - cornerR,
          size.height - vSpace - areaHeight,
        ),
        radius: Radius.circular(cornerR),
        clockwise: false,
      )
      ..lineTo(
        size.width - hSpace - areaWidth + cornerR,
        size.height - vSpace - areaHeight,
      )
      ..arcToPoint(
        Offset(
          size.width - hSpace - areaWidth,
          size.height - vSpace - areaHeight + cornerR,
        ),
        radius: Radius.circular(cornerR),
        clockwise: false,
      )
      ..lineTo(size.width - hSpace - areaWidth, size.height)
      ..lineTo(0, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget PhotoWidgetTabViewable({
  required Widget child,
  double height = 250,
  double? width,
}) {
  return SizedBox(
    height: 250,
    width: width,
    child: GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: Get.context!,
          // useSafeArea: true,
          isScrollControlled: true,
          builder: (context) {
            return GestureDetector(
              onTap: Get.back,
              child: Container(
                color: AppColors.darkBackground.withOpacity(.9),
                alignment: Alignment.center,
                height: Get.height,
                child: child,
              ),
            );
          },
        ).then((value) {});
      },
      child: child,
    ),
  );
}

import 'dart:ui';
import 'package:admin_dashboard/app/cores/utils/asset_helper.dart';
import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:admin_dashboard/app/modules/shared_widgets/button/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../cores/themes/app_style.dart';
import '../text_widget/text_widget.dart';

class CustomDialog {
  static Future<T?> baseDialog<T>(
    BuildContext context, {
    bool barrierDismissible = true,
    required String title,
    required Widget bottomWidget,
    String? iconName,
    Color? iconColor,
    String? description,
    TextAlign descTextAlign = TextAlign.center,
    double iconSize = 24,
    VoidCallback? onDialogDismiss,
  }) async {
    // double mediaWidth = 350;
    iconColor ??= AppColors.green27AE60;
    await showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => WillPopScope(
        onWillPop: () async {
          if (onDialogDismiss != null) onDialogDismiss();
          return true;
        },
        child: Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: AppStyle.SPACING_16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(AppStyle.SPACING_24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                // width: mediaWidth,
                child: Column(
                  children: [
                    if (iconName != null) ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (iconName.split('.').last.toLowerCase() == 'svg')
                            SizedBox(
                              height: iconSize,
                              width: iconSize,
                              child: SvgPicture.asset(
                                AssetHelper.SvgAsset(iconName),
                                color: iconColor,
                              ),
                            )
                          else
                            Container(
                              height: iconSize,
                              width: iconSize,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    AssetHelper.iconPath(iconName),
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                      const SizedBox(height: AppStyle.SPACING_16),
                    ],
                    TextWidget(
                      title,
                      weight: FontWeight.bold,
                      fontSize: 16,
                      align: TextAlign.center,
                    ),
                    if (description != null) ...[
                      const SizedBox(height: AppStyle.SPACING_8),
                      TextWidget(
                        description,
                        align: descTextAlign,
                        color: AppColors.grey646C7B,
                      ),
                    ],
                    const SizedBox(height: AppStyle.SPACING_24),
                    Container(
                      // width: mediaWidth - 30,
                      child: bottomWidget,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return null;
  }

  static void showLoadingDialog<T>(
    BuildContext context, {
    bool barrierDismissible = true,
  }) {
    showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  'assets/lotties/loading.json',
                  width: 220,
                  // repeat: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future warningMessageDialog({
    required String message,
    Color? buttonFillColor,
    Function()? onButtonTap,
    VoidCallback? onDialogDismiss,
    bool barrierDismissible = true,
  }) {
    buttonFillColor ??= AppColors.redEB5757;
    return baseDialog(
      Get.context!,
      barrierDismissible: barrierDismissible,
      title: message,
      iconName: 'warning_triangle.svg',
      iconColor: AppColors.redEB5757,
      iconSize: 40,
      onDialogDismiss: onDialogDismiss,
      bottomWidget: RoundedButton(
        onPress: onButtonTap ?? Get.back,
        text: 'close'.tr,
        textColor: AppColors.white,
        fillColor: buttonFillColor,
        borderColor: Colors.transparent,
      ),
    );
  }
}

import 'package:admin_dashboard/app/cores/themes/app_style.dart';
import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:admin_dashboard/app/cores/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../index.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    super.key,
    this.loadingMessage = '',
  });
  final String loadingMessage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Semantics(
        label: 'Loading Screen',
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                /// testing svg
                SvgAsset.EditFill,
                width: 100,
              ),
              const SizedBox(
                height: AppStyle.SPACING_24,
              ),
              if (loadingMessage.isNotEmpty) ...[
                TextWidget(loadingMessage),
                const SizedBox(
                  height: AppStyle.SPACING_24,
                ),
              ],
              const CircularProgressIndicator(
                color: AppColors.black1D1D23,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

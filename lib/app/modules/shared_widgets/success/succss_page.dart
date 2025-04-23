import 'package:admin_dashboard/app/cores/themes/app_style.dart';
import 'package:admin_dashboard/app/cores/values/app_strings.dart';
import 'package:admin_dashboard/app/cores/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../index.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 168,
            width: 168,
            child: SvgPicture.asset(
              SvgAsset.success,
            ),
          ),
          const Gap(AppStyle.SPACING_24),
          TextWidget(
            // l10n.success,
            'succces',
            weight: FontWeight.w900,
            fontSize: AppStyle.SPACING_32,
          ),
          const Gap(AppStyle.SPACING_8),
          Row(
            children: [
              Expanded(
                child: TextWidget(
                  // l10n.you_have_successfully_changed_your_password_please_click_the_button_below_to_go_to_the_home_page,
                  'you have successfully changed your password please click the button below to go to the home page',
                  weight: FontWeight.w400,
                  fontSize: AppStyle.SPACING_14,
                  align: TextAlign.center,
                  color: AppColors.grey687A93,
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBarWidget: BottomWrapper(
        child: RoundedButton(
          // text: l10n.go_to_home,
          text: 'go to home',
          textColor: AppColors.white,
          fillColor: AppColors.blue0066FF,
          borderColor: Colors.transparent,
          onPress: () {
            // Get.offAllNamed(Routes.LOGIN);
          },
        ),
      ),
    );
  }
}

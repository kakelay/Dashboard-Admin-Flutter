import 'package:admin_dashboard/app/cores/themes/app_style.dart';
import 'package:admin_dashboard/app/cores/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

 

class BaseScaffoldWithAppIcon extends StatelessWidget {
  const BaseScaffoldWithAppIcon({
    super.key,
    required this.body,
    this.topPadding = AppStyle.SPACING_24,
    this.autoImplyLeading = true,
    this.action,
  });
  final Widget body;

  final double topPadding;
  final bool autoImplyLeading;
  final List<Widget>? action;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: autoImplyLeading,
        title: Row(
          children: [
            SvgPicture.asset(
              /// testing svg
              SvgAsset.RiHistiryFill,
              height: 34,
            ),
          ],
        ),
        actions: action,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: topPadding,
        ),
        child: body,
      ),
    );
  }
}

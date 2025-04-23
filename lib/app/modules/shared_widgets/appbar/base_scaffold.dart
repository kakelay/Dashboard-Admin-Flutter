import 'package:admin_dashboard/app/modules/shared_widgets/appbar/appbar_back_button.dart';
import 'package:flutter/material.dart';

import '../../../cores/themes/app_style.dart';
 

class BaseScaffold extends StatelessWidget {
  final Widget body;

  final Widget? bottomNavigationBarWidget;
  final Color? backgroundColor;
  final Color? appBardbackgroundColor;
  final Color? foregroundColor;
  final Color? titleColor;
  final Color? shadowColor;
  final Widget? leading;
  final bool hideBackButton;
  final bool centerTitle;
  final String title;
  final double topPadding;
  final double bottomPadding;
  final double elevation;
  final double horizontalPadding;
  final List<Widget>? action;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;

  const BaseScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBarWidget,
    this.hideBackButton = true,
    this.title = '',
    this.topPadding = AppStyle.SPACING_16,
    this.bottomPadding = 0,
    this.centerTitle = false,
    this.leading,
    this.backgroundColor,
    this.appBardbackgroundColor,
    this.elevation = 0,
    this.shadowColor,
    this.foregroundColor,
    this.horizontalPadding = AppStyle.SPACING_16,
    this.action,
    this.titleFontSize,
    this.titleFontWeight,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: title.isEmpty
            ? null
            : AppBar(
                foregroundColor: foregroundColor,
                leading: leading ?? _backButton(),
                title: title == ''
                    ? null
                    : Text(
                        title,
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: titleFontWeight,
                          color: titleColor,
                        ),
                      ),
                centerTitle: centerTitle,
                automaticallyImplyLeading: false,
                actions: action,
                backgroundColor: appBardbackgroundColor,
                elevation: elevation,
                shadowColor: shadowColor,
                titleSpacing: hideBackButton ? AppStyle.SPACING_16 : null,
              ),
        body: Padding(
          padding: EdgeInsets.only(
            top: topPadding,
            bottom: bottomPadding,
            left: horizontalPadding,
            right: horizontalPadding,
          ),
          child: body,
        ),
        bottomNavigationBar: bottomNavigationBarWidget,
      ),
    );
  }

  Widget? _backButton() {
    return hideBackButton ? null : AppbarBackButton();
  }
}

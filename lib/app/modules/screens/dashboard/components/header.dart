import 'package:admin_dashboard/app/modules/screens/dashboard/components/ProfileCardWidget.dart';
import 'package:admin_dashboard/app/modules/screens/dashboard/components/SearchFieldWidget.dart';
import 'package:flutter/material.dart';
import '../../../../../responsive.dart';

class Header extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final bool showProfile;

  const Header({
    Key? key,
    this.title,
    this.titleWidget,
    this.showProfile = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget displayTitle = titleWidget ??
        Text(
          title ?? "",
          style: Theme.of(context).textTheme.titleLarge,
        );

    return Row(
      children: [
        if (!Responsive.isMobile(context)) displayTitle,
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(
          child: SearchFieldWidget(
            controller: TextEditingController(),
            onChanged: (value) {
              print("Search input: $value");
            },
            onSearch: () {
              print("Search button tapped");
            },
          ),
        ),
        if (showProfile)
          const ProfileCardWidget(
            profileImageUrl:
                "https://avatars.githubusercontent.com/u/110383694?v=4",
            userName: "KakElay",
          ),
      ],
    );
  }
}

import 'package:admin_dashboard/app/modules/screens/dashboard/components/ProfileCardWidget.dart';
import 'package:admin_dashboard/app/modules/screens/dashboard/components/SearchFieldWidget.dart';
import 'package:flutter/material.dart';
import '../../../../../responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isMobile(context))
          Text(
            "Dashboard Admin",
            style: Theme.of(context).textTheme.titleLarge,
          ),
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
        const ProfileCardWidget(
          profileImageUrl:
              "https://avatars.githubusercontent.com/u/110383694?v=4",
          userName: "KakElay",
        ),
      ],
    );
  }
}

import 'package:admin_dashboard/app/modules/screens/dashboard/components/ProfileCardWidget.dart';
import 'package:admin_dashboard/app/modules/screens/dashboard/components/SearchFieldWidget.dart';
import 'package:flutter/material.dart';
import '../../../../../responsive.dart';

class Header extends StatefulWidget {
  final String? title;
  final Widget? titleWidget;
  final bool showProfile;
  final ValueChanged<String>? onSearch;

  const Header({
    Key? key,
    this.title,
    this.titleWidget,
    this.showProfile = true,
    this.onSearch,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget displayTitle = widget.titleWidget ??
        Text(
          widget.title ?? "",
          style: Theme.of(context).textTheme.titleLarge,
        );

    return Row(
      children: [
        if (!Responsive.isMobile(context)) displayTitle,
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(
          child: SearchFieldWidget(
            controller: _searchController,
            onChanged: widget.onSearch,
          ),
        ),
        if (widget.showProfile)
          const ProfileCardWidget(
            profileImageUrl:
                "https://avatars.githubusercontent.com/u/110383694?v=4",
            userName: "KakElay",
          ),
      ],
    );
  }
}
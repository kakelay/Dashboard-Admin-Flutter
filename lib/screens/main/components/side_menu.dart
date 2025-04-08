import 'package:admin_dashboard/constants.dart'; // Import the constants file
import 'package:admin_dashboard/responsive.dart';
import 'package:admin_dashboard/screens/theme_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? secondaryColorDark : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Light shadow
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(2, 0), // Shadow on the right side
          ),
        ],
      ),
      child: Drawer(
        backgroundColor: isDarkMode ? secondaryColorDark : Colors.white,
        child: ListView(
          children: [
            if (Responsive.isDesktop(context) || Responsive.isTablet(context))
              const Gap(50),
            DrawerListTile(
              title: "Transaction",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () {},
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              title: "Task",
              svgSrc: "assets/icons/menu_task.svg",
              press: () {},
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              title: "Documents",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () {},
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              title: "Store",
              svgSrc: "assets/icons/menu_store.svg",
              press: () {},
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              title: "Notification",
              svgSrc: "assets/icons/menu_notification.svg",
              press: () {},
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              title: "Profile",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {},
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              title: "Settings",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {},
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              title: "Log Out",
              svgSrc: "assets/icons/logout.svg",
              press: () {},
              color: Colors.red,
              isDarkMode: isDarkMode,
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.isDarkMode,
    this.color, // Default color handled dynamically
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool isDarkMode;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(
          isDarkMode ? Colors.white : Colors.blue,
          BlendMode.srcIn,
        ),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color ?? (isDarkMode ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

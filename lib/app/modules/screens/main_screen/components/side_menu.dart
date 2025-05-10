import 'package:admin_dashboard/constants.dart';
import 'package:admin_dashboard/responsive.dart';
import 'package:admin_dashboard/app/modules/screens/dashboard_screen/dashboard_screen.dart';
import 'package:admin_dashboard/app/modules/screens/notification_screen/notification_screen.dart';
import 'package:admin_dashboard/app/modules/screens/profile_screen/profile_screen.dart';
import 'package:admin_dashboard/app/modules/screens/setting_screen/setting_screen.dart';
import 'package:admin_dashboard/app/modules/screens/main_screen/store_screen.dart';
import 'package:admin_dashboard/app/modules/screens/main_screen/task_screen.dart';
import 'package:admin_dashboard/app/modules/screens/transaction_screen/transaction_screen.dart';
import 'package:admin_dashboard/app/cores/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatefulWidget {
  final int selectedIndex;
  final Function(int, Widget) onMenuTap;

  const SideMenu({
    Key? key,
    required this.onMenuTap,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  void updateSelectedIndex(int index, Widget screen) {
    widget.onMenuTap(
      index,
      screen,
    );
    // Send index + screen back to parent
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? secondaryColorDark : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(2, 0),
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
              index: 0,
              isSelected: widget.selectedIndex == 0,
              title: "Dashboard",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () => updateSelectedIndex(0, const DashboardScreen()),
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              index: 1,
              isSelected: widget.selectedIndex == 1,
              title: "Transaction",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () => updateSelectedIndex(1, TransactionScreen()),
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              index: 2,
              isSelected: widget.selectedIndex == 2,
              title: "Task",
              svgSrc: "assets/icons/menu_task.svg",
              press: () => updateSelectedIndex(2, const TaskScreen()),
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              index: 3,
              isSelected: widget.selectedIndex == 3,
              title: "Store",
              svgSrc: "assets/icons/menu_store.svg",
              press: () => updateSelectedIndex(3, const StoreScreen()),
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              index: 4,
              isSelected: widget.selectedIndex == 4,
              title: "Notification",
              svgSrc: "assets/icons/menu_notification.svg",
              press: () => updateSelectedIndex(4, const NotificationScreen()),
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              index: 5,
              isSelected: widget.selectedIndex == 5,
              title: "Profile",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () => updateSelectedIndex(5, const ProfileScreen()),
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              index: 6,
              isSelected: widget.selectedIndex == 6,
              title: "Settings",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () => updateSelectedIndex(6, const SettingScreen()),
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
    required this.index,
    required this.isSelected,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool isDarkMode;
  final int index;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final selectedColor = isDarkMode ? Colors.blueGrey[700] : Colors.blue[50];
    final iconColor =
        isSelected ? Colors.blue : (isDarkMode ? Colors.white : Colors.black);

    return Container(
      color: isSelected ? selectedColor : Colors.transparent,
      child: ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(
          svgSrc,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          height: 16,
        ),
        title: Text(
          title,
          style: TextStyle(color: iconColor),
        ),
      ),
    );
  }
}

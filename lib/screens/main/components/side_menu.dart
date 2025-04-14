import 'package:admin_dashboard/constants.dart'; // Import the constants file
import 'package:admin_dashboard/responsive.dart';
import 'package:admin_dashboard/screens/dashboard/dashboard_screen.dart';
import 'package:admin_dashboard/screens/main/notification_screen.dart';
import 'package:admin_dashboard/screens/main/profile_screen.dart';
import 'package:admin_dashboard/screens/main/setting_screen.dart';
import 'package:admin_dashboard/screens/main/store_screen.dart';
import 'package:admin_dashboard/screens/main/task_screen.dart';
import 'package:admin_dashboard/screens/main/transaction_screen.dart';
import 'package:admin_dashboard/screens/theme_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

// class SideMenu extends StatelessWidget {
//   const SideMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     final isDarkMode = themeProvider.isDarkMode;

//     return Container(
//       decoration: BoxDecoration(
//         color: isDarkMode ? secondaryColorDark : Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1), // Light shadow
//             blurRadius: 10,
//             spreadRadius: 5,
//             offset: const Offset(2, 0), // Shadow on the right side
//           ),
//         ],
//       ),
//       child: Drawer(
//         backgroundColor: isDarkMode ? secondaryColorDark : Colors.white,
//         child: ListView(
//           children: [
//             if (Responsive.isDesktop(context) || Responsive.isTablet(context))
//               const Gap(50),
//             DrawerListTile(
//               title: "Accounts",
//               svgSrc: "assets/icons/menu_tran.svg",
//               press: () {},
//               isDarkMode: isDarkMode,

//             ),
//             DrawerListTile(
//               title: "Transaction",
//               svgSrc: "assets/icons/menu_tran.svg",
//               press: () {},
//               isDarkMode: isDarkMode,
//             ),
//             DrawerListTile(
//               title: "Task",
//               svgSrc: "assets/icons/menu_task.svg",
//               press: () {},
//               isDarkMode: isDarkMode,
//             ),
//             DrawerListTile(
//               title: "DashboardScreen",
//               svgSrc: "assets/icons/menu_doc.svg",
//               press: () {},
//               isDarkMode: isDarkMode,
//             ),
//             DrawerListTile(
//               title: "Store",
//               svgSrc: "assets/icons/menu_store.svg",
//               press: () {},
//               isDarkMode: isDarkMode,
//             ),
//             DrawerListTile(
//               title: "Notification",
//               svgSrc: "assets/icons/menu_notification.svg",
//               press: () {},
//               isDarkMode: isDarkMode,
//             ),
//             DrawerListTile(
//               title: "Profile",
//               svgSrc: "assets/icons/menu_profile.svg",
//               press: () {},
//               isDarkMode: isDarkMode,
//             ),
//             DrawerListTile(
//               title: "Settings",
//               svgSrc: "assets/icons/menu_setting.svg",
//               press: () {},
//               isDarkMode: isDarkMode,
//             ),
//             DrawerListTile(
//               title: "Log Out",
//               svgSrc: "assets/icons/logout.svg",
//               press: () {},
//               isDarkMode: isDarkMode,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class SideMenu extends StatelessWidget {
  final Function(Widget) onMenuTap;

  const SideMenu({Key? key, required this.onMenuTap}) : super(key: key);

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
              title: "Dashboard",
              svgSrc: "assets/icons/menu_doc.svg",
              press: () => onMenuTap(const DashboardScreen()),
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              title: "Transaction",
              svgSrc: "assets/icons/menu_tran.svg",
              press: () => onMenuTap(const TransactionScreen()),
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              title: "Task",
              svgSrc: "assets/icons/menu_task.svg",
              press: () => onMenuTap(const TaskScreen()),
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              title: "Store",
              svgSrc: "assets/icons/menu_store.svg",
              press: () => onMenuTap(const StoreScreen()),
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              title: "Notification",
              svgSrc: "assets/icons/menu_notification.svg",
              press: () => onMenuTap(const NotificationScreen()),
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              title: "Profile",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () => onMenuTap(const ProfileScreen()),
              isDarkMode: isDarkMode,
            ),
            DrawerListTile(
              title: "Settings",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () => onMenuTap(const SettingScreen()),
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

import 'package:admin_dashboard/constants.dart';
import 'package:admin_dashboard/screens/dashboard/dashboard_screen.dart';
import 'package:admin_dashboard/screens/dashboard/logout_screen.dart';
import 'package:admin_dashboard/screens/dashboard/notification_screen.dart';
import 'package:admin_dashboard/screens/dashboard/profile_screen.dart';
import 'package:admin_dashboard/screens/dashboard/settings_screen.dart';
import 'package:admin_dashboard/screens/dashboard/store_screen.dart';
import 'package:admin_dashboard/screens/dashboard/task_screen.dart';
import 'package:admin_dashboard/screens/dashboard/transaction_screen.dart';
import 'package:admin_dashboard/screens/theme_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/MenuAppController.dart';
import '../../responsive.dart';

import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isMenuOpen = true; // Default to open on desktop
  Widget currentScreen = DashboardScreen(); // Default screen

  void onMenuItemSelected(String menu) {
    setState(() {
      switch (menu) {
        case "TransactionScreen":
          currentScreen = const TransactionScreen();
          break;
        case "TaskScreen":
          currentScreen = const TaskScreen();
          break;
        case "StoreScreen":
          currentScreen = const StoreScreen();
          break;
        case "NotificationScreen":
          currentScreen = const NotificationScreen();
          break;
        case "ProfileScreen":
          currentScreen = const ProfileScreen();
          break;
        case "SettingsScreen":
          currentScreen = const SettingsScreen();
          break;
        case "LogoutScreen":
          currentScreen = const LogoutScreen();
          break;
        default:
          currentScreen = const DashboardScreen(); // Fallback to Dashboard
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;
    final iconColor = isDarkMode ? Colors.white : secondaryColorDark;

    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      appBar: AppBar(
        leading: Responsive.isDesktop(context)
            ? IconButton(
                icon: Icon(
                  isMenuOpen ? Icons.menu_open : Icons.menu,
                  color: iconColor,
                ),
                onPressed: () {
                  setState(() {
                    isMenuOpen = !isMenuOpen;
                  });
                },
              )
            : null,
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.dark_mode : Icons.light_mode,
              color: iconColor,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      drawer: !Responsive.isDesktop(context)
          ? SideMenu(
              onMenuSelect: onMenuItemSelected,
            )
          : null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context) && isMenuOpen)
              Expanded(
                child: SideMenu(onMenuSelect: onMenuItemSelected),
              ),
            Expanded(
              flex: isMenuOpen ? 5 : 6, // Adjust width dynamically
              child: DashboardScreen(), // Display the selected screen
            ),
          ],
        ),
      ),
    );
  }
}

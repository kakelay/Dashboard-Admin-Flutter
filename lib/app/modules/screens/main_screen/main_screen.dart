import 'package:admin_dashboard/app/modules/screens/notification_screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/MenuAppController.dart';
import '../../../../responsive.dart';
import '../dashboard_screen/dashboard_screen.dart';

import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isMenuOpen = true;
  Widget currentScreen = const DashboardScreen(); // Default screen
  int selectedIndex = 0;

  // Simulate notification count
  int notificationCount = 1;

  void _setScreen(int index, Widget screen) {
    setState(() {
      selectedIndex = index;
      currentScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Responsive.isMobile(context)
            ? Text(
                "Dashboard Admin",
                style: Theme.of(context).textTheme.titleLarge,
              )
            : const Text('Menu'),
        centerTitle: Responsive.isMobile(context),
        leading: Responsive.isDesktop(context)
            ? IconButton(
                icon: Icon(
                  isMenuOpen ? Icons.menu_open : Icons.menu,
                ),
                onPressed: () {
                  setState(() {
                    isMenuOpen = !isMenuOpen;
                  });
                },
              )
            : null,
        actions: [
          Stack(
            children: [
              IconButton(
                padding: const EdgeInsets.only(right: 20),
                onPressed: () {
                  _setScreen(4, const NotificationScreen());
                },
                icon: const Icon(Icons.notifications),
              ),
              if (notificationCount > 0)
                Positioned(
                  right: 10,
                  top: 2,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      notificationCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      drawer: !Responsive.isDesktop(context)
          ? SideMenu(
              onMenuTap: _setScreen,
              selectedIndex: selectedIndex,
            )
          : null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context) && isMenuOpen)
              Expanded(
                child: SideMenu(
                  onMenuTap: _setScreen,
                  selectedIndex: selectedIndex,
                ),
              ),
            Expanded(
              flex: isMenuOpen ? 5 : 6,
              child: currentScreen,
            ),
          ],
        ),
      ),
    );
  }
}

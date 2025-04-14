// import 'package:admin_dashboard/constants.dart';
// import 'package:admin_dashboard/screens/theme_provider/theme_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../controllers/MenuAppController.dart';
// import '../../responsive.dart';
// import '../dashboard/dashboard_screen.dart';
// import 'components/side_menu.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   bool isMenuOpen = true; // Default to open on desktop

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     final isDarkMode = themeProvider.isDarkMode;
//     final iconColor = isDarkMode ? Colors.white : secondaryColorDark;

//     return Scaffold(
//       key: context.read<MenuAppController>().scaffoldKey,
//       appBar: AppBar(
//         leading: Responsive.isDesktop(context)
//             ? IconButton(
//                 icon: Icon(
//                   isMenuOpen ? Icons.menu_open : Icons.menu,
//                   color: iconColor,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     isMenuOpen = !isMenuOpen;
//                   });
//                 },
//               )
//             : null,
//         actions: [
//           IconButton(
//             icon: Icon(
//               isDarkMode ? Icons.dark_mode : Icons.light_mode,
//               color: iconColor,
//             ),
//             onPressed: () {
//               themeProvider.toggleTheme();
//             },
//           ),
//         ],
//       ),
//       drawer: !Responsive.isDesktop(context) ? const SideMenu() : null,
//       body: SafeArea(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (Responsive.isDesktop(context) && isMenuOpen)
//               const Expanded(
//                 child: SideMenu(),
//               ),
//             Expanded(
//               flex: isMenuOpen ? 5 : 6,
//               child: const DashboardScreen(),
//                     child: const SettingScreen(),       child: const TaskScreen(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// main_screen.dart
import 'package:admin_dashboard/constants.dart';
import 'package:admin_dashboard/screens/theme_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/MenuAppController.dart';
import '../../responsive.dart';
import '../dashboard/dashboard_screen.dart';

import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isMenuOpen = true;
  Widget _selectedScreen = const DashboardScreen(); // Default screen

  void _setScreen(Widget screen) {
    setState(() {
      _selectedScreen = screen;
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
          ? SideMenu(onMenuTap: _setScreen)
          : null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context) && isMenuOpen)
              Expanded(
                child: SideMenu(onMenuTap: _setScreen),
              ),
            Expanded(
              flex: isMenuOpen ? 5 : 6,
              child: _selectedScreen,
            ),
          ],
        ),
      ),
    );
  }
}

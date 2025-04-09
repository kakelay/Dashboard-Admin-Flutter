// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../controllers/MenuAppController.dart';
// import '../../responsive.dart';
// import '../dashboard/dashboard_screen.dart';
// import 'components/side_menu.dart';

// class MainScreen extends StatelessWidget {
//   const MainScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: context.read<MenuAppController>().scaffoldKey,
//       drawer: const SideMenu(),
//       body: SafeArea(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // We want this side menu only for large screen
//             if (Responsive.isDesktop(context))
//               const Expanded(
//                 // default flex = 1
//                 // and it takes 1/6 part of the screen
//                 child: SideMenu(),
//               ),
//             const Expanded(
//               // It takes 5/6 part of the screen
//               flex: 5,
//               child: DashboardScreen(),
//               // child: Text('Accounts'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
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
  bool isMenuOpen = true; // Default to open on desktop

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
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: iconColor,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
        ],
      ),
      drawer: !Responsive.isDesktop(context) ? const SideMenu() : null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context) && isMenuOpen)
              Expanded(
                child: SideMenu(),
              ),
            Expanded(
              flex: isMenuOpen ? 5 : 6, // Adjust width dynamically
              child: const DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  final Function(String) onMenuSelect;

  const SideMenu({super.key, required this.onMenuSelect});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text(
              "Menu",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildMenuItem("Transaction", Icons.attach_money, context),
          _buildMenuItem("Task", Icons.task, context),
          _buildMenuItem("Store", Icons.store, context),
          _buildMenuItem("Notification", Icons.notifications, context),
          _buildMenuItem("Profile", Icons.person, context),
          _buildMenuItem("Settings", Icons.settings, context),
          _buildMenuItem("Logout", Icons.exit_to_app, context),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        onMenuSelect(title); // Notify MainScreen
      },
    );
  }
}

import 'package:admin_dashboard/app/cores/themes/app_style.dart';
import 'package:admin_dashboard/app/modules/shared_widgets/text_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/app/cores/themes/theme_provider.dart'; // Assuming you have a ThemeProvider class

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String selectedTheme = 'Dark'; // Track the selected theme
  @override
  void initState() {
    super.initState();
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    selectedTheme = themeProvider.isDarkMode ? 'Dark' : 'Light';
  }

  @override
  Widget build(BuildContext context) {
    // Determine the background and text color based on the selected theme
    bool isDarkMode = selectedTheme == 'Dark';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black12 : Colors.white,
        title: TextWidget(
          'Settings',
          color: isDarkMode ? Colors.white : Colors.black,
          fontSize: AppStyle.SPACING_20,
        ),
      ),
      backgroundColor: isDarkMode ? Colors.black12 : Colors.white24,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 900,
            height: 600,
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey[850] : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _dropdownRow(
                    'Theme',
                    ['Light', 'Dark'],
                    selectedTheme,
                    isDarkMode ? Colors.white : Colors.black,
                  ),
                  const SizedBox(height: 10),
                  _switchRow(
                    'Always show code when using data analyst',
                    true,
                    isDarkMode ? Colors.white : Colors.black,
                  ),
                  _switchRow(
                    'Show follow-up suggestions in chats',
                    true,
                    isDarkMode ? Colors.white : Colors.black,
                  ),
                  _dropdownRow(
                    'Language',
                    ['Auto-detect', 'English', 'Khmer'],
                    'Auto-detect',
                    isDarkMode ? Colors.white : Colors.black,
                  ),
                  const SizedBox(height: 20),
                  _buttonRow('Archived chats', 'Manage', isDarkMode),
                  _buttonRow('Archive all chats', 'Archive all', isDarkMode),
                  _buttonRow('Delete all chats', 'Delete all', isDarkMode,
                      color: Colors.red),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _dropdownRow(
      String label, List<String> options, String selected, Color textColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(color: textColor),
        ),
        DropdownButton<String>(
          value: selected,
          style: TextStyle(color: textColor),
          items: options
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedTheme = value ?? 'Dark'; // Change selected theme
              _updateTheme(context, selectedTheme);
            });
          },
        ),
      ],
    );
  }

  Widget _switchRow(String label, bool value, Color textColor) {
    return SwitchListTile(
      value: value,
      onChanged: (_) {},
      title: Text(label, style: TextStyle(color: textColor)),
      activeColor: Colors.green,
    );
  }

  Widget _buttonRow(String label, String action, bool isDarkMode,
      {Color? color}) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      trailing: SizedBox(
        width: 150, // You can adjust the width as per your requirement
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor:
                color ?? (isDarkMode ? Colors.grey[700] : Colors.grey[300]),
          ),
          child: Text(action),
        ),
      ),
    );
  }

  void _updateTheme(BuildContext context, String theme) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    if (theme == 'Light') {
      themeProvider
          .setLightMode(); // Assuming you have a method in ThemeProvider to set light mode
    } else {
      themeProvider
          .setDarkMode(); // Assuming you have a method in ThemeProvider to set dark mode
    }
  }
}

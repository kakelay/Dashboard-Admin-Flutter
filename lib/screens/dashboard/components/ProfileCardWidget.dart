import 'package:admin_dashboard/constants.dart';
import 'package:admin_dashboard/responsive.dart';
import 'package:admin_dashboard/screens/theme_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileCardWidget extends StatelessWidget {
  final String profileImageUrl;
  final String userName;

  const ProfileCardWidget({
    Key? key,
    required this.profileImageUrl,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;
    final textColor = isDarkMode ? Colors.white : secondaryColorDark;
    final iconColor = isDarkMode ? Colors.white : secondaryColorDark;
    final bgColor = isDarkMode ? secondaryColorDark : Colors.white;

    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: defaultPadding),
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: defaultPadding / 2,
          ),
          decoration: BoxDecoration(
            color: bgColor, // Adjust based on theme
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border:
                Border.all(color: isDarkMode ? Colors.white24 : Colors.black12),
          ),
          child: Row(
            children: [
              Image.network(
                profileImageUrl,
                height: Responsive.isMobile(context) ? 28 : 38,
              ),
              if (!Responsive.isMobile(context))
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding / 2),
                  child: Text(
                    userName,
                    style: TextStyle(
                        color: textColor), // Change text color dynamically
                  ),
                ),
              Icon(Icons.keyboard_arrow_down,
                  color: iconColor), // Adjust icon color
            ],
          ),
        ),
        IconButton(
          icon: Icon(
            isDarkMode ? Icons.dark_mode : Icons.light_mode,
            color: iconColor, // Adjust icon color
          ),
          onPressed: () {
            themeProvider.toggleTheme();
          },
        ),
      ],
    );
  }
}

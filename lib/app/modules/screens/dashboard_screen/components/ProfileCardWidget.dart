import 'package:admin_dashboard/constants.dart';
import 'package:admin_dashboard/responsive.dart';
import 'package:admin_dashboard/app/cores/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileCardWidget extends StatefulWidget {
  final String profileImageUrl;
  final String userName;

  const ProfileCardWidget({
    Key? key,
    required this.profileImageUrl,
    required this.userName,
  }) : super(key: key);

  @override
  State<ProfileCardWidget> createState() => _ProfileCardWidgetState();
}

class _ProfileCardWidgetState extends State<ProfileCardWidget> {
  bool _isDialogVisible = false;

  void _showProfileDetails(BuildContext context) {
    setState(() {
      _isDialogVisible = true;
    });

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.all(16.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(widget.profileImageUrl),
              ),
              const SizedBox(height: 12),
              Text(
                widget.userName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              const Text('Email: kak.elay@example.com'),
              const Text('Role: Administrator'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    _isDialogVisible = false;
                  });
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    ).then((_) {
      if (mounted) {
        setState(() {
          _isDialogVisible = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;
    final textColor = isDarkMode ? Colors.white : secondaryColorDark;
    final iconColor = isDarkMode ? Colors.white : secondaryColorDark;
    final bgColor = isDarkMode ? secondaryColorDark : Colors.white;

    return GestureDetector(
      onTap: () => _showProfileDetails(context),
      child: Container(
        margin: const EdgeInsets.only(left: defaultPadding),
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding / 2,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border:
              Border.all(color: isDarkMode ? Colors.white24 : Colors.black12),
        ),
        child: Row(
          children: [
            ClipOval(
              child: Image.network(
                widget.profileImageUrl,
                height: Responsive.isMobile(context) ? 28 : 38,
                width: Responsive.isMobile(context) ? 28 : 38,
                fit: BoxFit.cover,
              ),
            ),
            if (!Responsive.isMobile(context))
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                child: Text(
                  widget.userName,
                  style: TextStyle(color: textColor),
                ),
              ),
            Icon(
              _isDialogVisible
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }
}

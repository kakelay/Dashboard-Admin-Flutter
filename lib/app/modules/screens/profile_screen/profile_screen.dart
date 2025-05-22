import 'package:admin_dashboard/app/cores/themes/app_style.dart';
import 'package:admin_dashboard/app/modules/shared_widgets/text_widget/text_widget.dart';
import 'package:admin_dashboard/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/app/cores/themes/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black12 : Colors.white,
        title: TextWidget(
          'Profile',
          color: isDarkMode ? Colors.white : Colors.black,
          fontSize: AppStyle.SPACING_20,
        ),
      ),
      backgroundColor: isDarkMode ? Colors.black12 : Colors.white24,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Container(
            width: isMobile ? double.infinity : 1000,
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey[850] : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: isDarkMode
                      ? Colors.black45
                      : Colors.grey.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            padding: const EdgeInsets.all(24),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _profileSidebar(isDarkMode, isMobile: true),
                      const SizedBox(height: 24),
                      _profileDetails(isDarkMode),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _profileSidebar(isDarkMode),
                      const SizedBox(width: 32),
                      Expanded(child: _profileDetails(isDarkMode)),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _profileSidebar(bool isDarkMode, {bool isMobile = false}) {
    return Container(
      width: isMobile ? double.infinity : 300,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/110383694?v=4'),
          ),
          const SizedBox(height: 16),
          Text(
            'KakElay',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'kakelay18052002@gmail.com',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: isDarkMode ? Colors.grey[400] : Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Administrator',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Edit Profile'),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Change Password'),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () {},
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }

  Widget _profileDetails(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Profile Overview',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        const Divider(height: 32),
        _infoRow('Full Name', 'Admin Name', isDarkMode),
        _infoRow('Email', 'admin@example.com', isDarkMode),
        _infoRow('Role', 'Administrator', isDarkMode),
        _infoRow('Phone', '+855 10600261', isDarkMode),
        _infoRow('Joined Date', 'January 1, 2024', isDarkMode),
        _infoRow(
            'Address',
            'Sangkat Chrang Chamreh Pir is a village in Chrang Chamreh Pir, Ruessei Kaev, Phnom Penh. Sangkat Chrang Chamreh Pir is situated nearby to the hamlet Phum Kiloumaet Leik Prammuoy, as well as near the village Sangkat Chrang Chamreh Muoy.',
            isDarkMode),
        _infoRow('Date of Birth', 'January 1, 2002', isDarkMode),
        _infoRow(
            'Short Bio',
            'Experienced administrator with a passion for management and leadership. Enthusiastic about technology and education.',
            isDarkMode),
      ],
    );
  }

  Widget _infoRow(String label, String value, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isDarkMode ? Colors.grey[300] : Colors.grey[800],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

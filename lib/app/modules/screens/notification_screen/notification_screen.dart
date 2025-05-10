import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/app/cores/themes/app_style.dart';
import 'package:admin_dashboard/app/cores/themes/theme_provider.dart';
import 'package:admin_dashboard/app/modules/shared_widgets/text_widget/text_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<dynamic> notifications = [];

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    // Load JSON data from the assets folder
    final String response =
        await rootBundle.loadString('assets/jsons/notification_sample.json');
    final data = json.decode(response);
    setState(() {
      notifications = data[
          'notifications']; // Adjust this if the JSON structure is different
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine if the device is mobile or tablet/desktop
    bool isMobile = MediaQuery.of(context).size.width < 600;
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black12 : Colors.white,
        title: TextWidget(
          'Notifications',
          color: isDarkMode ? Colors.white : Colors.black,
          fontSize: AppStyle.SPACING_20,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(isMobile ? 8.0 : 16.0),
        child: notifications.isEmpty
            ? const Center(
                child:
                    CircularProgressIndicator()) // Show loading spinner if data is not loaded yet
            : ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return _notificationCard(
                    context,
                    notification['title'] ?? 'No Title',
                    notification['time'] ?? 'No Time',
                  );
                },
              ),
      ),
    );
  }

  Widget _notificationCard(BuildContext context, String title, String time) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Card(
      margin: EdgeInsets.only(bottom: isMobile ? 8.0 : 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 12.0 : 16.0),
        child: Row(
          children: [
            Icon(
              Icons.notifications,
              color: Theme.of(context).primaryColor,
              size: isMobile ? 24 : 32,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: isMobile ? 12 : 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            isMobile
                ? IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {},
                  )
                : const SizedBox.shrink(), // Hide on desktop/tablet
          ],
        ),
      ),
    );
  }
}

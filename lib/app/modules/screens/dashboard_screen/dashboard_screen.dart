import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../responsive.dart';
import 'components/header.dart';

import 'components/my_fields.dart';
import 'components/recent_files.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(
              title: "Dashboard Admin",
              showProfile: true,
              showCalendar: false,
            ),
            const SizedBox(height: defaultPadding),
            // Wrap scrollable content in Expanded so it doesn't overflow
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          const MyFiles(),
                          const SizedBox(height: defaultPadding),
                          const RecentFiles(),
                          if (Responsive.isMobile(context))
                            const SizedBox(height: defaultPadding),
                          if (Responsive.isMobile(context))
                            const StorageDetails(),
                        ],
                      ),
                    ),
                    if (!Responsive.isMobile(context))
                      const SizedBox(width: defaultPadding),
                    if (!Responsive.isMobile(context))
                      const Expanded(
                        flex: 2,
                        child: StorageDetails(),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

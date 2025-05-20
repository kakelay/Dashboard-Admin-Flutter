// no_internet_page.dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("No Internet")),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off, size: 100, color: Colors.red),
            Gap(20),
            Text("No Internet Connection", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

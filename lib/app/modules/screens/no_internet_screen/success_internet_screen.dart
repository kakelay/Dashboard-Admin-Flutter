import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class SuccessInternetScreen extends StatelessWidget {
  const SuccessInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie animation instead of the Icon
            Lottie.asset(
              'assets/lotties/success.json',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            const Gap(20),
            const Text("No Internet Connection",
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

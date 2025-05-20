// success_connection_page.dart

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessConnectionPage extends StatelessWidget {
  const SuccessConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/lotties/success.json',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

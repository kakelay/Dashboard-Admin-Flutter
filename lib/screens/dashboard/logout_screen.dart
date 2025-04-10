import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Logout Screen",
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
      ),
    );
  }
}

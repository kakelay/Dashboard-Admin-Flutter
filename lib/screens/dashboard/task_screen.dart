import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Task Screen", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    );
  }
}

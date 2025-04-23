import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  const TextDivider({super.key, required this.child, this.spacing = 16.0});

  final Widget child;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(endIndent: spacing)),
        child,
        Expanded(child: Divider(indent: spacing)),
      ],
    );
  }
}

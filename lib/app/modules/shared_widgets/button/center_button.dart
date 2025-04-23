import 'package:flutter/material.dart';

class CenterButton extends StatelessWidget {
  const CenterButton({
    super.key,
    required this.text,
    this.icon,
    this.iconHeight = 18,
    this.spacing = 8,
    this.style,
    this.onPressed,
  });

  final Widget text;
  final String? icon;
  final double? iconHeight;
  final double? spacing;
  final ButtonStyle? style;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          text,
          SizedBox(width: spacing),
          if (icon != null)
            Image.asset(
              icon!,
              height: iconHeight,
            ),
        ],
      ),
    );
  }
}

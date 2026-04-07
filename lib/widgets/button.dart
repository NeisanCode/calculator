import 'package:calculator/colors/color.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String? text;
  final Color color;
  final IconData? icon;
  final VoidCallback onTap;
  const Button({
    super.key,
    this.text,
    this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textLight,
      ),
      child: icon != null
          ? Icon(icon, size: 28)
          : Text(
              text!,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
            ),
    );
  }
}

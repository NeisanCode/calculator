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
        foregroundColor: Colors.white,
      ),
      child: text != null
          ? Text(
              text!,
              style: TextStyle(
                fontSize: 23,
                fontFamily: "Baloo2",
                fontWeight: FontWeight.bold,
              ),
            )
          : Icon(icon, size: 24),
    );
  }
}

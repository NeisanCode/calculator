import 'package:flutter/material.dart';

class ButtonData {
  final String? text;
  final String type;
  final IconData? icon;
  final VoidCallback? onTap;
  ButtonData({this.text, this.icon, required this.type, this.onTap});
}

final buttons = [
  ButtonData(text: "⌫", type: "action", icon: Icons.backspace_outlined),
  ButtonData(text: "AC", type: "action"),
  ButtonData(text: "%", type: "action", icon: Icons.percent),
  ButtonData(text: "÷", type: "operator"),
  ButtonData(text: "7", type: "number"),
  ButtonData(text: "8", type: "number"),
  ButtonData(text: "9", type: "number"),
  ButtonData(text: "x", type: "operator"),
  ButtonData(text: "4", type: "number"),
  ButtonData(text: "5", type: "number"),
  ButtonData(text: "6", type: "number"),
  ButtonData(text: "-", type: "operator"),
  ButtonData(text: "1", type: "number"),
  ButtonData(text: "2", type: "number"),
  ButtonData(text: "3", type: "number"),
  ButtonData(text: "+", type: "operator"),
  ButtonData(text: "⁺∕₋", type: "toggle"),
  ButtonData(text: "0", type: "number"),
  ButtonData(text: ".", type: "number"),
  ButtonData(text: "=", type: "operator"),
];

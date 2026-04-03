import 'package:flutter/material.dart';

class ButtonData {
  final String? text;
  final String type;
  final IconData? icon;
  final VoidCallback? onTap;
  ButtonData({this.text, this.icon, required this.type, this.onTap});
}

final buttons = [
  ButtonData(text: "AC", type: "action", icon: null),
  ButtonData(text: "+/-", type: "action", icon: null),
  ButtonData(text: "%", type: "action", icon: null),
  ButtonData(text: "÷", type: "operator", icon: null),
  ButtonData(text: "7", type: "number", icon: null),
  ButtonData(text: "8", type: "number", icon: null),
  ButtonData(text: "9", type: "number", icon: null),
  ButtonData(text: "x", type: "operator", icon: null),
  ButtonData(text: "4", type: "number", icon: null),
  ButtonData(text: "5", type: "number", icon: null),
  ButtonData(text: "6", type: "number", icon: null),
  ButtonData(text: "-", type: "operator", icon: null),
  ButtonData(text: "1", type: "number", icon: null),
  ButtonData(text: "2", type: "number", icon: null),
  ButtonData(text: "3", type: "number", icon: null),
  ButtonData(text: "+", type: "operator", icon: null),
  ButtonData(text: null, type: "toggle", icon: Icons.calculate_rounded),
  ButtonData(text: "0", type: "number", icon: null),
  ButtonData(text: ".", type: "number", icon: null),
  ButtonData(text: "=", type: "operator", icon: null),
];

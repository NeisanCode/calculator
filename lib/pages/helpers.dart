import 'package:calculator/colors/color.dart';
import 'package:calculator/data/buttons.dart';
import 'package:flutter/animation.dart';

Color getButtonColor(ButtonData data) {
  switch (data.type) {
    case "operator":
      return operatorBtn;
    case "action":
      return actionBtn;
    default:
      return digitBtn;
  }
}

String getCurrentNumber(String text) {
  if (text.isEmpty) return text;
  if (RegExp(r'[+x÷-]$').hasMatch(text)) {
    return text; // string ends with an operator, so return the whole string
  }
  final match = RegExp(r"[+x÷](?=-?[^+x÷-]*$)").firstMatch(
    text,
  ); // if the string ends with a number, find the last operator to get the current number
  if (match == null) return text;
  return text.substring(match.end);
}

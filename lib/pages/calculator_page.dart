import 'package:calculator/pages/helpers.dart';
import 'package:calculator/service/service.dart';
import 'package:flutter/material.dart';
import 'package:calculator/colors/color.dart';
import 'package:calculator/data/buttons.dart';
import 'package:calculator/widgets/button.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String calculText = "";
  String resultText = "";
  double c = 30;
  bool showcalculText = true;
  bool textExceed = false;
  bool isPositive = true;
  bool focusResult = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        leading: Icon(Icons.calculate_rounded, color: Colors.white),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (showcalculText)
                    Text(
                      calculText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: textExceed ? 30 : 60,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  Text(
                    resultText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: focusResult
                          ? Colors.white
                          : const Color.fromARGB(164, 255, 255, 255),
                      fontSize: focusResult ? 60 : 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              itemCount: buttons.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(2.5),
                child: Button(
                  text: buttons[index].text,
                  icon: buttons[index].icon,
                  color: getButtonColor(buttons[index]),
                  onTap: () => onButtonPressed(buttons[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onButtonPressed(ButtonData data) {
    setState(() {
      switch (data.type) {
        case "action":
          if (data.text == "AC") {
            _resetDisplay();
          }
          if (data.text == "⌫") {
            calculText = _deleteLastElement(calculText);
          }
          if (data.text == "%") {
            togglePercent(calculText);
            resultText = autoCalculResult(calculText) ?? "";
          }
          break;

        case "number":
          showcalculText = true;
          focusResult = false;
          calculText += data.text ?? "";
          textExceed = calculText.length >= 10;
          resultText = autoCalculResult(calculText) ?? "";
          break;

        case "operator":
          String op = data.text ?? "";
          if (calculText.isEmpty && op == "-") calculText += op;
          if (RegExp(r'[+x÷-]$').hasMatch(calculText)) return;
          if (data.text == "=") {
            resultText = autoCalculResult(calculText) ?? resultText;
            calculText = "";
            showcalculText = false;
            focusResult = true;
            return;
          }
          calculText += op;
          break;

        case "toggle":
          toggleSign(calculText);
          resultText = autoCalculResult(calculText) ?? "";
          break;
      }
    });
  }

  void _resetDisplay() {
    calculText = "";
    resultText = "";
  }

  String _deleteLastElement(String s) {
    if (s.isEmpty) return "";
    return s.substring(0, s.length - 1);
  }

  void toggleSign(String text) {
    String currentNumber = getCurrentNumber(text);
    if (currentNumber.isEmpty) return;
    final toggled = currentNumber.startsWith("-")
        ? currentNumber.substring(1)
        : "-$currentNumber";
    calculText =
        text.substring(0, text.length - currentNumber.length) + toggled;
  }

  void togglePercent(String text) {
    if (text.isEmpty) return;
    if (RegExp(r'[+x÷-]$').hasMatch(text)) return;
    final toggled = text.endsWith("%")
        ? text.substring(0, text.length - 1)
        : "$text%";
    calculText = toggled;
  }
}

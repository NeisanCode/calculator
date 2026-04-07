import 'package:calculator/colors/service/service.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      appBar: AppBar(leading: Icon(Icons.menu_rounded, color: Colors.orange)),
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
                  Text(
                    calculText,
                    style: TextStyle(
                      color: const Color.fromARGB(164, 255, 255, 255),
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    resultText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
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
                  color: _getButtonColor(buttons[index]),
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
          break;
        case "number":
          calculText += data.text ?? "";
          break;
        case "operator":
          if (data.text == "=") {
            resultText = calculateResult(calculText);
            break;
          }
          calculText += data.text ?? "";
          break;
        case "toggle":
          showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(title: Text("message"), content: Text("Toogle")),
          );
          break;
      }
    });
    setState(() {
      resultText = autoCalculResult(calculText) ?? "";
    });
  }

  void _resetDisplay() {
    calculText = "";
    resultText = "";
  }

  Color _getButtonColor(ButtonData data) {
    switch (data.type) {
      case "operator":
        return buttonColorOperator;
      case "action":
        return buttonColorAction;
      default:
        return buttonColorNumber;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:calculator/colors/color.dart';
import 'package:calculator/pages/calculator_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: background,
          foregroundColor: background,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: TextTheme(bodyMedium: TextStyle(fontFamily: "Baloo2")),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(TextStyle(fontFamily: "Baloo2")),
          ),
        ),
      ),
      home: CalculatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

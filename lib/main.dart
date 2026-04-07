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
          backgroundColor: appColor,
          foregroundColor: appColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: CalculatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

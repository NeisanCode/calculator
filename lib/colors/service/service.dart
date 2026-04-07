import 'package:math_expressions/math_expressions.dart';

String? autoCalculResult(String userInput) {
  if (userInput.isEmpty) return null;
  if (!userInput.contains(RegExp(r'[+x÷-]'))) return null;
  if (!RegExp(r'\d$').hasMatch(userInput)) return null;
  return calculateResult(userInput);
}

String calculateResult(String userInput) {
  if (userInput.isEmpty) return "";
  var finalUserInput = userInput;
  finalUserInput = finalUserInput.replaceAll("x", "*").replaceAll("÷", "/");

  try {
    GrammarParser p = GrammarParser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    var evaluator = RealEvaluator(cm);
    var eval = evaluator.evaluate(exp);
    return eval.toStringAsFixed(eval.toInt().toDouble() == eval ? 0 : 2);
  } catch (e) {
    return "ERREUR";
  }
}

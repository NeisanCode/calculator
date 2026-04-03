import 'package:math_expressions/math_expressions.dart';

String? autoCalculResult(String userInput) {
  if (!userInput.contains(RegExp(r'[+x÷-]'))) {
    return "";
  }
  return null;
}

String calculateResult(String userInput) {
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

import '../classes/classes.dart' show MathFunction;
import '../methods/methods.dart' show analyzeFunction;

void main() async {
  String function = "(4/x + 2)";
  await analyzeFunction(function);
}

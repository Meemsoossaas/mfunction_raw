import '../classes/classes.dart';
import '../methods/methods.dart' show analyzeFunction;

void main() async {
  String function = "(3/x) - (4/x - 2) + 2";
  print(MathFunction(function).componentTypes);
  await analyzeFunction(function);
}

import '../methods/methods.dart' show analyzeFunction;

void main() async {
  String function =
      "((x + 1)/(x - 2))";
  await analyzeFunction(function);
}

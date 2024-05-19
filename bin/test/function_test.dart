import '../methods/methods.dart' show analyzeFunction;

void main() async {
  String function =
      "(8/2 * x - 2)";
  await analyzeFunction(function);
}

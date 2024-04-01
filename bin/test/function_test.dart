import '../methods/methods.dart' show analyzeFunction;

void main() async {
  String function =
      "-(2/x + 2) + (e + 4^x) - sqrt(4 + x)(x) - sin(x) - cos(sin(x + 3) + x - 2) - ln(x + 5) - log(2)(4) - lg(8 + e) + (2ex) + 5 + 10";
  await analyzeFunction(function);
}

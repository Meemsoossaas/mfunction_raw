import 'package:math_expressions/math_expressions.dart';

void main() {
  Expression e = Parser().parse('2x + ln(e)');
  print(e.toString());
}

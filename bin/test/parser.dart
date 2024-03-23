import 'package:math_expressions/math_expressions.dart';

void main() {
  Parser p = Parser();
  Expression e = p.parse('lg(2)');
  print(e);
}
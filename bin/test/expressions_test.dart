import 'package:equations/equations.dart';

void main() {
  Quadratic c = Quadratic.realEquation(a: 1, b: -2);
  print(c.solutions());
}
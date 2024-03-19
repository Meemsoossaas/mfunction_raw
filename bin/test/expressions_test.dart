import 'package:equations/equations.dart';

void main() {
  Quadratic c = Quadratic.realEquation(a: 1);
  print(c.solutions());
}
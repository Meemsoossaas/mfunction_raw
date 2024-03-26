import 'package:equations/equations.dart';

void main() {
  Newton n = Newton(function: '2 * x', x0: 1);
  print(n.solve().guesses);
}

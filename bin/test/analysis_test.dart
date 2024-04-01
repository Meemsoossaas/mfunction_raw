import 'package:equations/equations.dart';

void main() {
  RegExp regExp = RegExp(r'([-+]?)sqrt\(([0-9]+)\)\(([\s\S]*)\)');
  var matches = regExp.allMatches('sqrt(4)(3x + e)');
  for (var match in matches) {
    print(match.group(0)!);
  }
}

void main() {
  String expression = 'sin(2)(x + cos(x)) + cos(3)(x) - tan(1)(3 + x)';
  RegExp trigonometricRegex = RegExp(
    r'([+-]?)(sin|cos|tan)(\([^()]*\))(\(([^()]*)\))',
  );

  Iterable<RegExpMatch> matches = trigonometricRegex.allMatches(expression);

  for (RegExpMatch match in matches) {
    print(match.groupCount);
    print(match.group(0)!);
    print(match.group(1)!);
    print(match.group(2)!);
    print(match.group(3)!);
    print(match.group(4)!);
    print(match.group(5)!);
    String prefix = match.group(1) ?? '+';
    String keyword = match.group(2)!;
    String exponent = match.group(3)!;
    String innerContent = match.group(4) ?? match.group(3)!;

    print(
      'Prefix: $prefix, Keyword: $keyword, Exponent: $exponent, Inner Content: $innerContent',
    );
  }
}

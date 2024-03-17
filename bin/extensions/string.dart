part of 'extensions.dart';

extension StringFunctionExtensions on String {
  String trimFunction([bool precise = false]) {
    switch (precise) {
      case true:
        trimLeft();
        trimRight();
        return this;
      case false:
        return trim();
    }
  }

  String removeWhitespace() => replaceAll(RegExp(r'\s+'), ' ');
}

extension StringPropertiesExtensions on String {
  bool get isAFunction => regexps.fullFunctionRegex.hasMatch(this);

  bool get isNotAFunction => !isAFunction;

  bool get isNumber => regexps.numberRegex.hasMatch(this);

  bool get isVariable => isChar && regexps.alphabetRegex.hasMatch(this);

  bool get isPi => isChar && this == constants.pi;

  bool get isEuler => isChar && this == constants.euler;

  bool get isTrigonometric =>
      (contains(constants.sin)) ||
      (contains(constants.cos)) ||
      (contains(constants.tan));

  bool get isLogarithmic =>
      (contains(constants.log)) ||
      (contains(constants.lg)) ||
      (contains(constants.ln));

  bool get isMathOperator =>
      isChar &&
      ((this == constants.plus) ||
          (this == constants.minus) ||
          (this == constants.times) ||
          (this == constants.divideBy) ||
          (this == constants.power));

  bool get isBracket =>
      isChar &&
      ((this == constants.leftBracket) || (this == constants.rightBracket));

  bool get isChar => length == 1;
}

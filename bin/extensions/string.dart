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

  String removeWhitespace() => replaceAll(RegExp(r'\s+'), '');

  String modifyFunctionInterpolation<T extends FunctionManipulationOptions>(
    FunctionModificationType modificationType,
    T options,
  ) {
    switch (modificationType) {
      case FunctionModificationType.add:
        return (options is AddOptions) ? _add(this, options) : this;
      case FunctionModificationType.replace:
        return (options is ReplaceOptions) ? _replace(this, options) : this;
      case FunctionModificationType.delete:
        return (options is DeleteOptions) ? _delete(this, options) : this;
    }
  }
}

String _add(String function, AddOptions options) {
  throw UnimplementedError();
}

String _replace(String function, ReplaceOptions options) {
  throw UnimplementedError();
}

String _delete(String function, DeleteOptions options) {
  throw UnimplementedError();
}

extension StringPropertiesExtensions on String {
  bool get isAFunction => regexps.fullFunctionRegex.hasMatch(this);

  bool get isNotAFunction => !isAFunction;

  bool get isNumber =>
      regexps.integerRegex.hasMatch(this) &&
      !regexps.alphabetRegex.hasMatch(this);

  bool get isDecimal =>
      regexps.decimalRegex.hasMatch(this) &&
      regexps.alphabetRegex.hasMatch(this);

  bool get isVariable => isChar && regexps.alphabetRegex.hasMatch(this);

  bool get isPi => isChar && this == constants.pi;

  bool get isEuler => isChar && this == constants.euler;

  bool get isTrigonometric =>
      (contains(constants.sin)) ||
      (contains(constants.cos)) ||
      (contains(constants.tan));

  bool get isTrigonometricKeyword =>
      (length == 3) &&
      ((contains(constants.sin)) ||
          (contains(constants.cos)) ||
          (contains(constants.tan)));

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

  String get first => this[0];

  String get last => this[length - 1];

  String get mid => this[length % 2 == 0 ? length ~/ 2 : (length / 2).round()];
}

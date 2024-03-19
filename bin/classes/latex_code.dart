part of 'classes.dart';

final class LaTexCode extends Equatable {
  static const String elementOf = '\\in';

  static const String infinity = "\\infty";
  static const String positiveInfinity = "+\\infty";
  static const String negativeInfinity = "-\\infty";

  static const String prime = "\\mathbb{P}";
  static const String whole = "\\mathbb{W}";
  static const String natural = "\\mathbb{N}";
  static const String integer = "\\mathbb{Z}";
  static const String irrational = "\\mathbb{I}";
  static const String rational = "\\mathbb{Q}";
  static const String real  = "\\mathbb{R}";
  static const String complex = "\\mathbb{C}";
  static const String quaternion = "\\mathbb{H}";
  static const String octonions = "\\mathbb{O}";
  static const String sedenions = "\\mathbb{S}";

  static const String definitionSet = "D";

  static const String lessThan = "<";
  static const String greaterThan = ">";
  static const String lessOrEqualTo = "\\leq";
  static const String greaterOrEqualTo = "\\geq";

  @override
  List<Object?> get props => [];
}

part of 'typedefs.dart';

typedef FunctionBuilder<T extends num> = T Function(
  T x, [
  T? rest,
]);

typedef AnalysisBuilder = void Function(
  AnalysisContext context,
  ExtractionCollection collection,
  MathAnalysisOperations currentOperation,
);

typedef MathAnalysisOperationBuilder = List<AnalysisBuilder>;

typedef FunctionExtractionResult<T extends Object> = Map<int, T>;

typedef ComponentCombination = ({
  ComponentType type,
  String component,
});

typedef ExtractionCollection = ({
  FractionResult fractionResult,
  LogarithmicResult logarithmicResult,
  RootResult rootResult,
  ExponentialResult exponentialResult,
  TrigonometricResult trigonometricResult,
});

typedef SingleResult = ({
  String prefix,
  String single,
});

typedef FactorResult = ({
  String prefix,
  List<String> factors,
});

typedef FractionResult = ({
  String prefix,
  String numerator,
  String denominator,
});

typedef LogarithmicResult = ({
  String prefix,
  String base,
  String result,
});

typedef RootResult = ({
  String prefix,
  String n,
  String value,
});

typedef ExponentialResult = ({
  String prefix,
  String base,
  String power,
});

typedef TrigonometricResult = ({
  String prefix,
  String keyword,
  String exponent,
  String innerContent,
});

typedef FractionOperatorResult = ({
  List<String> numeratorOperators,
  List<String> denominatorOperators,
});

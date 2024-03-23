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

typedef FractionResult = ({
  String numerator,
  String denominator,
});

typedef LogarithmicResult = ({
  String base,
  String result,
});

typedef RootResult = ({
  String n,
  String value,
});

typedef ExponentialResult = ({
  String base,
  String power,
});

typedef TrigonometricResult = ({
  String keyword,
  String exponent,
  String innerCount,
});

typedef FractionOperatorResult = ({
  List<String> numeratorOperators,
  List<String> denominatorOperators,
});

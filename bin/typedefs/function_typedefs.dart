part of 'typedefs.dart';

typedef FunctionExtractionResult<T> = Map<int, T>;

typedef ComponentCombination = ({
  ComponentType type,
  String component,
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

typedef FractionOperatorResult = ({
  List<String> numeratorOperators,
  List<String> denominatorOperators,
});

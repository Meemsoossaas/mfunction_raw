part of 'typedefs.dart';

typedef FunctionManipulation<T extends Object> = ({
  Map<int, String> elements,
  FunctionExtractionResult<T> extractionInfo,
});

typedef MathOperatorResult = ({
  int index,
  String mathOperator,
});

typedef StringManipulationSummary = ({
FunctionManipulation<SingleResult> singleResult,
  FunctionManipulation<FactorResult> factorResult,
  FunctionManipulation<FractionResult> fractionResult,
  FunctionManipulation<LogarithmicResult> logarithmicResult,
  FunctionManipulation<RootResult> rootResult,
  FunctionManipulation<ExponentialResult> exponentialResult,
  FunctionManipulation<TrigonometricResult> trigonometricResult,
});

typedef ExpressionMap = Map<int, String>;

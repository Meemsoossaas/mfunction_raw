part of 'classes.dart';

mixin class MathAnalysisService {
  static const String defaultVariable = 'x';

  static final MathAnalysisService instance = MathAnalysisService._internal();

  factory MathAnalysisService() => instance;

  MathAnalysisService._internal();

  DefinitionSetResult definitionSet(
    String function,
    FunctionExtractionResult<FractionResult> extractFractionInfo,
    FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
    FunctionExtractionResult<RootResult> extractRootInfo,
  ) {
    throw Exception();
  }
}

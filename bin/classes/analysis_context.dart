part of 'classes.dart';

final class AnalysisContext extends Equatable with MathAnalysisService {
  final String functionName;
  final VariableLimits variableLimits;
  final NumberTypes validNumbers;
  final AnalysisLimits analysisLimits;

  const AnalysisContext(
    this.functionName, {
    this.variableLimits = VariableLimits.none,
    this.validNumbers = NumberTypes.real,
    this.analysisLimits = const AnalysisLimits(),
  });

  const AnalysisContext.currentDefault()
      : functionName = 'f',
        variableLimits = VariableLimits.none,
        validNumbers = NumberTypes.real,
        analysisLimits = const AnalysisLimits();

  @override
  List<Object?> get props => [
        functionName,
        variableLimits,
        validNumbers,
      ];
}

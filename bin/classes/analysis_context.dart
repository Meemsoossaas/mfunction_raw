part of 'classes.dart';

final class AnalysisContext with MathAnalysisService {
  final String functionName;

  const AnalysisContext(this.functionName);

  const AnalysisContext.currentDefault() : functionName = 'f';
}

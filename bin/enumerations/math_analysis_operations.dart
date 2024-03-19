part of 'enumerations.dart';

enum MathAnalysisOperations {
  preAnalysis(description: ''),
  definitionSet(description: ''),
  setOfValues(description: ''),
  asymptotes(description: ''),
  limits(description: ''),
  zeroPoints(description: ''),
  derivation(description: ''),
  monotony(description: ''),
  slope(description: ''),
  extremePoints(description: ''),
  curvature(description: ''),
  turningPoint(description: ''),
  integral(description: '');

  final String description;

  const MathAnalysisOperations({
    required this.description,
  });
}

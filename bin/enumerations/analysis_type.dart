part of 'enumerations.dart';

enum AnalysisType {
  standardAnalysis(
    promptName: 'Standard Analysis',
    operations: [],
  ),
  quickAnalysis(
    promptName: 'Quick Analysis',
    operations: [],
  );

  final List<MathAnalysisOperations> operations;
  final String promptName;

  const AnalysisType({
    required this.promptName,
    required this.operations,
  });

  int numberOfOperations() => operations.length;
}

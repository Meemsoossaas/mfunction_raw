part of 'methods.dart';

Future<void> analyzeFunction(String function) async {
  final StringManipulationService service = StringManipulationService();
  final func = function.removeWhitespace();
  if (func.isNotAFunction) {
    throw Exception();
  }
  final fractions = service.findFractions(func);
  final logarithmicExpressions = service.findLogarithmicExpressions(func);
  final rootExpressions = service.findRootExpressions(func);
  final extractFractionInfo = service.extractFractionInfo(fractions);
  final extractLogarithmicInfo =
      service.extractLogarithmicInfo(logarithmicExpressions);
  final extractRootInfo = service.extractRootInfo(rootExpressions);
  _startAnalysis(
    func,
    extractFractionInfo,
    extractLogarithmicInfo,
    extractRootInfo,
  );
}

void _startAnalysis(
  String function,
  FunctionExtractionResult<FractionResult> extractFractionInfo,
  FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
  FunctionExtractionResult<RootResult> extractRootInfo,
) {
  AnalysisContext context = AnalysisContext.currentDefault();
  Parser p = Parser();
  final Expression simplifiedFunction = p.parse(function).simplify();

}

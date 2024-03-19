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
  final exponentialExpressions = service.findExponentialExpressions(func);
  final extractFractionInfo = service.extractFractionInfo(fractions);
  final extractLogarithmicInfo =
      service.extractLogarithmicInfo(logarithmicExpressions);
  final extractRootInfo = service.extractRootInfo(rootExpressions);
  final extractExponentialInfo =
      service.extractExponentialInfo(exponentialExpressions);
  print(extractFractionInfo);
  print(extractLogarithmicInfo);
  print(extractRootInfo);
  print(extractExponentialInfo);
  _startAnalysis(
    func,
    extractFractionInfo,
    extractLogarithmicInfo,
    extractRootInfo,
    extractExponentialInfo,
  );
}

void _startAnalysis(
  String function,
  FunctionExtractionResult<FractionResult> extractFractionInfo,
  FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
  FunctionExtractionResult<RootResult> extractRootInfo,
  FunctionExtractionResult<ExponentialResult> extractExponentialInfo, [
  AnalysisContext context = const AnalysisContext.currentDefault(),
]) {
  final MathAnalysisService service = MathAnalysisService();
  Parser p = Parser();
  final Expression simplifiedFunction = p.parse(function).simplify();
  service.operate(
    context,
    simplifiedFunction,
    extractFractionInfo,
    extractLogarithmicInfo,
    extractRootInfo,
    extractExponentialInfo,
  );
}

part of 'methods.dart';

Future<void> analyzeFunction(String function) async {
  final StringManipulationService service = StringManipulationService();
  final FunctionConvertService convertService = FunctionConvertService();
  final func = function.removeWhitespace();
  if (func.isNotAFunction) {
    throw Exception();
  }
  print(func);
  MathFunction mathFunction = MathFunction(func);
  final factors = service.findFactors(func);
  final fractions = service.findFractions(func);
  final logarithmicExpressions = service.findLogarithmicExpressions(func);
  final rootExpressions = service.findRootExpressions(func);
  final exponentialExpressions = service.findExponentialExpressions(func);
  final trigonometricExpressions = service.findTrigonometricExpression(func);
  print(factors);
  print(fractions);
  print(logarithmicExpressions);
  print(rootExpressions);
  print(exponentialExpressions);
  print(trigonometricExpressions);

  final extractFactorInfo = service.extractFactorInfo(factors);
  final extractFractionInfo = service.extractFractionInfo(fractions);
  final extractLogarithmicInfo =
  service.extractLogarithmicInfo(logarithmicExpressions);
  final extractRootInfo = service.extractRootInfo(rootExpressions);
  final extractExponentialInfo =
  service.extractExponentialInfo(exponentialExpressions);
  final extractionTrigonometricInfo =
  service.extractTrigonometricInfo(trigonometricExpressions);

  print(extractFactorInfo);
  print(extractFractionInfo);
  print(extractLogarithmicInfo);
  print(extractRootInfo);
  print(extractExponentialInfo);
  print(extractionTrigonometricInfo);

  var getMathOperations = mathFunction.componentTypes.values.where(
        (element) => element.type == ComponentType.mathOperator,
  );
  var mathOperators = <MathOperatorResult>[];
  for (var operation in mathOperators) {
    mathOperators.add(
      (
      index: operation.index,
      mathOperator: operation.mathOperator,
      ),
    );
  }
  String convertedFunction = await convertService.convert(
    (
    factorResult: (
    elements: factors,
    extractionInfo: extractFactorInfo,
    ),
    fractionResult: (
    elements: fractions,
    extractionInfo: extractFractionInfo,
    ),
    logarithmicResult: (
    elements: logarithmicExpressions,
    extractionInfo: extractLogarithmicInfo,
    ),
    rootResult: (
    elements: rootExpressions,
    extractionInfo: extractRootInfo,
    ),
    exponentialResult: (
    elements: exponentialExpressions,
    extractionInfo: extractExponentialInfo,
    ),
    trigonometricResult: (
    elements: trigonometricExpressions,
    extractionInfo: extractionTrigonometricInfo,
    ),
    ),
    mathOperators: mathOperators,
  );

  print(convertedFunction);

  _startAnalysis(
    convertedFunction,
    extractFractionInfo,
    extractLogarithmicInfo,
    extractRootInfo,
    extractExponentialInfo,
    extractionTrigonometricInfo,
  );
}

void _startAnalysis(String function,
    FunctionExtractionResult<FractionResult> extractFractionInfo,
    FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
    FunctionExtractionResult<RootResult> extractRootInfo,
    FunctionExtractionResult<ExponentialResult> extractExponentialInfo,
    FunctionExtractionResult<TrigonometricResult> extractionTrigonometricInfo, [
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
    extractionTrigonometricInfo,
  );
}

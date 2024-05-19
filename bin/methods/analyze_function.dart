part of 'methods.dart';

Future<void> analyzeFunction(String function) async {
  final StringManipulationService service = StringManipulationService.instance;
  final FunctionConvertService convertService = FunctionConvertService.instance;
  final func = function.removeWhitespace();
  if (func.isNotAFunction) {
    throw AnalyzeFunctionException(0);
  }
  print(func);
  // MathFunction mathFunction = MathFunction(func);
  final fractions = await service.findFractions(func);
  print('Fractions: ${fractions.newFunction}');
  final logarithmicExpressions = await service.findLogarithmicExpressions(
    fractions.newFunction,
  );
  print('Logarithmic expressions: ${logarithmicExpressions.newFunction}');
  final rootExpressions = await service.findRootExpressions(
    logarithmicExpressions.newFunction,
  );
  print('Root expressions: ${rootExpressions.newFunction}');
  final exponentialExpressions = await service.findExponentialExpressions(
    rootExpressions.newFunction,
  );
  print('Exponential expressions: ${exponentialExpressions.newFunction}');
  final trigonometricExpressions = await service.findTrigonometricExpression(
    exponentialExpressions.newFunction,
  );
  print('Trigonometric expressions: ${trigonometricExpressions.newFunction}');
  final factors = await service.findFactors(
    trigonometricExpressions.newFunction,
  );
  print('Factors: ${factors.newFunction}');
  final singles = await service.findSingles(
    factors.newFunction,
  );
  print('Singles: ${singles.hashCode}');

  final extractSingleInfo = service.extractSingleInfo(
    singles.elements,
  );
  final extractFactorInfo = service.extractFactorInfo(
    factors.elements,
  );
  final extractFractionInfo = service.extractFractionInfo(
    fractions.elements,
  );
  final extractLogarithmicInfo = service.extractLogarithmicInfo(
    logarithmicExpressions.elements,
  );
  final extractRootInfo = service.extractRootInfo(
    rootExpressions.elements,
  );
  final extractExponentialInfo = service.extractExponentialInfo(
    exponentialExpressions.elements,
  );
  final extractionTrigonometricInfo = service.extractTrigonometricInfo(
    trigonometricExpressions.elements,
  );

  print('ExtractSingleInfo: $extractSingleInfo');
  print('ExtractFactorInfo: $extractFactorInfo');
  print('ExtractFractionInfo: $extractFractionInfo');
  print('ExtractLogarithmicInfo: $extractLogarithmicInfo');
  print('ExtractRootInfo: $extractRootInfo');
  print('ExtractExponentialInfo: $extractExponentialInfo');
  print('ExtractionTrigonometricInfo: $extractionTrigonometricInfo');

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
      singleResult: (
        elements: singles.elements,
        extractionInfo: extractSingleInfo,
      ),
      factorResult: (
        elements: factors.elements,
        extractionInfo: extractFactorInfo,
      ),
      fractionResult: (
        elements: fractions.elements,
        extractionInfo: extractFractionInfo,
      ),
      logarithmicResult: (
        elements: logarithmicExpressions.elements,
        extractionInfo: extractLogarithmicInfo,
      ),
      rootResult: (
        elements: rootExpressions.elements,
        extractionInfo: extractRootInfo,
      ),
      exponentialResult: (
        elements: exponentialExpressions.elements,
        extractionInfo: extractExponentialInfo,
      ),
      trigonometricResult: (
        elements: trigonometricExpressions.elements,
        extractionInfo: extractionTrigonometricInfo,
      ),
    ),
  );
  print('Converted function: $convertedFunction');
  _startAnalysis(
    convertedFunction,
    extractSingleInfo,
    extractFactorInfo,
    extractFractionInfo,
    extractLogarithmicInfo,
    extractRootInfo,
    extractExponentialInfo,
    extractionTrigonometricInfo,
  );
}

void _startAnalysis(
  String function,
  FunctionExtractionResult<SingleResult> extractSingleInfo,
  FunctionExtractionResult<FactorResult> extractFactorInfo,
  FunctionExtractionResult<FractionResult> extractFractionInfo,
  FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
  FunctionExtractionResult<RootResult> extractRootInfo,
  FunctionExtractionResult<ExponentialResult> extractExponentialInfo,
  FunctionExtractionResult<TrigonometricResult> extractionTrigonometricInfo, [
  AnalysisContext context = const AnalysisContext.currentDefault(),
]) {
  final MathAnalysisService service = MathAnalysisService();
  Parser p = Parser();
  final Expression simplifiedFunction = p.parse(function);
  service.operate(
    context,
    simplifiedFunction.simplify(),
    extractSingleInfo,
    extractFactorInfo,
    extractFractionInfo,
    extractLogarithmicInfo,
    extractRootInfo,
    extractExponentialInfo,
    extractionTrigonometricInfo,
  );
}

part of 'classes.dart';

mixin class FunctionConvertService {
  static final FunctionConvertService instance =
      FunctionConvertService._internal();

  factory FunctionConvertService() => instance;

  FunctionConvertService._internal();

  Future<String> convert(
    StringManipulationSummary summary, {
    required List<MathOperatorResult> mathOperators,
  }) async {
    return await _convert(
      summary,
      mathOperators,
    );
  }

  Future<String> _convert(
    StringManipulationSummary summary,
    List<MathOperatorResult> mathOperators,
  ) async {
    StringBuffer buffer = StringBuffer();
    var factorResult = <String>[];
    final factorExtractionInfo = summary.factorResult.extractionInfo;
    factorExtractionInfo.forEach(
      (key, value) {
        StringBuffer buffer = StringBuffer();
        num multipliedCoefficient = 1;
        List<String> numberList = value.factors
            .where(
              (element) => element.isNumber || element.isDecimal,
            )
            .toList();
        for (var number in numberList) {
          num parsedNumber = num.parse(number);
          multipliedCoefficient *= parsedNumber;
        }
        List<String> variableList = value.factors
            .where(
              (element) =>
                  element.isVariable || element.isEuler || element.isPi,
            )
            .toList();
        Set<String> uniqueVariables = Set.from(variableList);
        for (var uniqueVariable in uniqueVariables) {
          int occurrences = variableList.countOccurrencesOf<String>(
            uniqueVariable,
          );
          if (occurrences > 1) {
            String duplicateSyntax = '($uniqueVariable^$occurrences)';
            buffer.write(
              buffer.isEmpty ? duplicateSyntax : '*$duplicateSyntax',
            );
          } else {
            buffer.write(
              buffer.isEmpty ? uniqueVariable : '*$uniqueVariable',
            );
          }
        }
        factorResult.add(
          '${value.prefix}(${multipliedCoefficient.toString()}*${buffer.toString()})',
        );
      },
    );
    var trigonometricResult = <String>[];
    final trigonometricExtractionInfo =
        summary.trigonometricResult.extractionInfo;
    trigonometricExtractionInfo.forEach(
      (key, value) {
        trigonometricResult.add(
          '${value.prefix}(${value.keyword}(${value.innerContent})^${value.exponent})',
        );
      },
    );
    var rootResult = <String>[];
    final rootExtractionInfo = summary.rootResult.extractionInfo;
    rootExtractionInfo.forEach(
      (key, value) {
        rootResult.add(
          '${value.prefix}(${value.value}^1/${value.n})',
        );
      },
    );
    var logarithmicResult = <String>[];
    final logarithmicExtractionInfo = summary.logarithmicResult.extractionInfo;
    logarithmicExtractionInfo.forEach(
      (key, value) {
        logarithmicResult.add(
          '${value.prefix}(ln(${value.result})/ln(${value.base}))',
        );
      },
    );
    var fractionResult = <String>[];
    final fractionExtractionInfo = summary.fractionResult.extractionInfo;
    fractionExtractionInfo.forEach(
      (key, value) {
        fractionResult.add(
          '${value.prefix}(${value.numerator}/${value.denominator})',
        );
      },
    );
    var exponentialResult = <String>[];
    final exponentialExtractionInfo = summary.exponentialResult.extractionInfo;
    exponentialExtractionInfo.forEach(
      (key, value) {
        exponentialResult.add('${value.prefix}(${value.base}^${value.power})');
      },
    );
    final summaryList = <String>[]
      ..addAll(factorResult)
      ..addAll(trigonometricResult)
      ..addAll(rootResult)
      ..addAll(logarithmicResult)
      ..addAll(fractionResult)
      ..addAll(exponentialResult);
    for (var component in summaryList) {
      buffer.write(component);
    }
    return buffer.toString();
  }
}

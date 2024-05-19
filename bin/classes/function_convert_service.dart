part of 'classes.dart';

mixin class FunctionConvertService {
  static final StringManipulationService sms =
      StringManipulationService.instance;

  static final FunctionConvertService instance =
      FunctionConvertService._internal();

  factory FunctionConvertService() => instance;

  FunctionConvertService._internal();

  Future<String> convertFunction(
    String processedFunction,
  ) async {
    throw UnimplementedError();
  }

  Future<String> convert(
    StringManipulationSummary summary,
  ) async {
    return await _convert(
      summary,
    );
  }

  Future<String> _convert(
    StringManipulationSummary summary,
  ) async {
    StringBuffer buffer = StringBuffer();
    // Converting Singles
    var singleResult = <String>[];
    final singleExtractionInfo = summary.singleResult.extractionInfo;
    num singleSummaryResult = 0;
    singleExtractionInfo.forEach(
      (key, value) {
        if (value.single.isNumber || value.single.isDecimal) {
          var addedSingle = '${value.prefix}${value.single}';
          num parsedSingle = num.parse(
            addedSingle,
          );
          singleSummaryResult += parsedSingle;
          singleResult.add('${value.prefix}(${value.single})');
        } else if (value.single.isEuler) {
          var addedEuler = '${value.prefix}(${math.e.toString()})';
          singleResult.add(
            addedEuler,
          );
        } else if (value.single.isPi) {
          var addedPi = '${value.prefix}(${math.pi.toString()})';
          singleResult.add(
            addedPi,
          );
        } else {
          var addedVariable = '${value.prefix}(${value.single})';
          singleResult.add(
            addedVariable,
          );
        }
      },
    );
    // Converting Factors
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
        Set<String> uniqueVariables = Set.from(
          variableList,
        );
        for (var uniqueVariable in uniqueVariables) {
          int occurrences = variableList.countOccurrencesOf<String>(
            uniqueVariable,
          );
          if (occurrences > 1) {
            String duplicateSyntax =
                '(${uniqueVariable.isEuler ? math.e.toString() : uniqueVariable.isPi ? math.pi.toString() : uniqueVariable}^$occurrences)';
            buffer.write(
              buffer.isEmpty ? '($duplicateSyntax' : '*$duplicateSyntax',
            );
          } else {
            buffer.write(
              buffer.isEmpty
                  ? uniqueVariable.isEuler
                      ? '(${math.e.toString()}'
                      : uniqueVariable.isPi
                          ? math.pi.toString()
                          : uniqueVariable
                  : '*${uniqueVariable.isEuler ? math.e.toString() : uniqueVariable.isPi ? math.pi.toString() : uniqueVariable}',
            );
          }
        }
        buffer.write(')');
        factorResult.add(
          '(${value.prefix}${multipliedCoefficient.toString()}*${buffer.toString()})',
        );
      },
    );
    // Converting Trigonometric Expressions
    var trigonometricResult = <String>[];
    final trigonometricExtractionInfo =
        summary.trigonometricResult.extractionInfo;
    trigonometricExtractionInfo.forEach(
      (key, value) async {
        var buffer = StringBuffer();
        final innerContent1 = value.innerContent.replaceAll(
          constants.euler,
          math.e.toString(),
        );
        final innerContent2 = innerContent1.replaceAll(
          constants.pi,
          math.pi.toString(),
        );
        trigonometricResult.add(
          '${value.prefix}((${value.keyword}(($innerContent2))^(${value.exponent})))',
        );
      },
    );
    // Converting Root Expressions
    var rootResult = <String>[];
    final rootExtractionInfo = summary.rootResult.extractionInfo;
    rootExtractionInfo.forEach(
      (key, value) {
        final innerValue1 =
            value.value.replaceAll(constants.euler, math.e.toString());
        final innerValue2 =
            innerValue1.replaceAll(constants.pi, math.pi.toString());
        final n1 = value.n.replaceAll(constants.euler, math.e.toString());
        final n2 = n1.replaceAll(constants.pi, math.pi.toString());
        rootResult.add(
          '${value.prefix}((($innerValue2)^(1/$n2)))',
        );
      },
    );
    // Converting Logarithmic Expressions
    var logarithmicResult = <String>[];
    final logarithmicExtractionInfo = summary.logarithmicResult.extractionInfo;
    logarithmicExtractionInfo.forEach(
      (key, value) {
        final innerResult1 =
            value.result.replaceAll(constants.euler, math.e.toString());
        final innerResult2 =
            innerResult1.replaceAll(constants.pi, math.pi.toString());
        final innerBase1 =
            value.base.replaceAll(constants.euler, math.e.toString());
        final innerBase2 =
            innerBase1.replaceAll(constants.pi, math.pi.toString());
        logarithmicResult.add(
          '${value.prefix}((ln($innerResult2))/(ln($innerBase2)))',
        );
      },
    );
    // Converting Fraction Expressions
    var fractionResult = <String>[];
    final fractionExtractionInfo = summary.fractionResult.extractionInfo;
    fractionExtractionInfo.forEach(
      (key, value) {
        final innerNumerator1 =
            value.numerator.replaceAll(constants.euler, math.e.toString());
        final innerNumerator2 =
            innerNumerator1.replaceAll(constants.pi, math.pi.toString());
        final innerDenominator1 =
            value.denominator.replaceAll(constants.pi, math.pi.toString());
        final innerDenominator2 =
            innerDenominator1.replaceAll(constants.pi, math.pi.toString());
        fractionResult.add(
          '${value.prefix}($innerNumerator2/$innerDenominator2)',
        );
      },
    );
    // Converting Exponential Expressions
    var exponentialResult = <String>[];
    final exponentialExtractionInfo = summary.exponentialResult.extractionInfo;
    exponentialExtractionInfo.forEach(
      (key, value) {
        final innerBase1 =
            value.base.replaceAll(constants.euler, math.e.toString());
        final innerBase2 =
            innerBase1.replaceAll(constants.pi, math.pi.toString());
        final innerPower1 =
            value.power.replaceAll(constants.euler, math.e.toString());
        final innerPower2 =
            innerPower1.replaceAll(constants.pi, math.pi.toString());
        exponentialResult.add(
          '${value.prefix}(($innerBase2)^($innerPower2))',
        );
      },
    );
    // Adding everything up
    final summaryList = <String>[]
      ..addAll(factorResult)
      ..addAll(trigonometricResult)
      ..addAll(rootResult)
      ..addAll(logarithmicResult)
      ..addAll(fractionResult)
      ..addAll(exponentialResult)
      ..addAll(singleResult);
    for (var component in summaryList) {
      buffer.write(
        buffer.isEmpty ? component.removeAtIndex(0) : component,
      );
    }
    return buffer.toString();
  }
}

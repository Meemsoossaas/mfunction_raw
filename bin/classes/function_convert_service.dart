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
    String? result;
    var trigonometricResult = <String>[];
    final trigonometricExtractionInfo =
        summary.trigonometricResult.extractionInfo;
    trigonometricExtractionInfo.forEach(
      (key, value) {
        trigonometricResult.add(
          '(${value.keyword}(${value.innerCount})^${value.exponent})',
        );
      },
    );
    var rootResult = <String>[];
    final rootExtractionInfo = summary.rootResult.extractionInfo;
    rootExtractionInfo.forEach(
      (key, value) {
        rootResult.add(
          '(${value.value}^1/${value.n})',
        );
      },
    );
    var logarithmicResult = <String>[];
    final logarithmicExtractionInfo = summary.logarithmicResult.extractionInfo;
    logarithmicExtractionInfo.forEach(
      (key, value) {
        logarithmicResult.add('(ln(${value.result})/ln(${value.base}))');
      },
    );
    return result ?? '';
  }
}

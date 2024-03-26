part of 'classes.dart';

mixin class MathAnalysisService {
  static const String defaultVariable = 'x';
  static const double defaultGuess = 1.0;

  static final MathAnalysisService instance = MathAnalysisService._internal();

  factory MathAnalysisService() => instance;

  MathAnalysisService._internal();

  /// Basically the [main()] of [MathAnalysisService]
  void operate(
    AnalysisContext context,
    Expression function,
    FunctionExtractionResult<FractionResult> extractFractionInfo,
    FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
    FunctionExtractionResult<RootResult> extractRootInfo,
    FunctionExtractionResult<ExponentialResult> extractExponentialInfo,
    FunctionExtractionResult<TrigonometricResult> extractionTrigonometricInfo,
  ) async {
    await _operate(
      context,
      function,
      extractFractionInfo,
      extractLogarithmicInfo,
      extractRootInfo,
      extractExponentialInfo,
      extractionTrigonometricInfo,
    );
  }

  Future<AnalysisResult> _operate(
    AnalysisContext context,
    Expression function,
    FunctionExtractionResult<FractionResult> extractFractionInfo,
    FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
    FunctionExtractionResult<RootResult> extractRootInfo,
    FunctionExtractionResult<ExponentialResult> extractExponentialInfo,
    FunctionExtractionResult<TrigonometricResult> extractionTrigonometricInfo,
  ) async {
    var result = <MathAnalysisOperations, Record>{};
    await _preAnalysis(
      context,
      function,
      extractFractionInfo,
      extractLogarithmicInfo,
      extractRootInfo,
      extractExponentialInfo,
      extractionTrigonometricInfo,
    ).then(
      (value) {
        print(value);
        result[MathAnalysisOperations.preAnalysis] = value;
      },
    );
    await _definitionSet(
      context,
      function,
      extractFractionInfo,
      extractLogarithmicInfo,
      extractRootInfo,
      extractExponentialInfo,
      extractionTrigonometricInfo,
    ).then(
      (value) {
        print(value);
        result[MathAnalysisOperations.definitionSet] = value;
      },
    );
    await _setOfValues(
      context,
      function,
      extractFractionInfo,
      extractLogarithmicInfo,
      extractRootInfo,
      extractExponentialInfo,
      extractionTrigonometricInfo,
    ).then(
      (value) {
        print(value);
        result[MathAnalysisOperations.setOfValues] = value;
      },
    );
    await _asymptotes(
      context,
      function,
      extractFractionInfo,
      extractLogarithmicInfo,
      extractRootInfo,
      extractExponentialInfo,
      extractionTrigonometricInfo,
      definitionSetResult:
          result[MathAnalysisOperations.definitionSet] as DefinitionSetResult,
    ).then(
      (value) {
        print(value);
        result[MathAnalysisOperations.asymptotes] = value;
      },
    );
    await _limits(
      context,
      function,
      extractFractionInfo,
      extractLogarithmicInfo,
      extractRootInfo,
      extractExponentialInfo,
      extractionTrigonometricInfo,
    ).then(
      (value) {
        print(value);
        result[MathAnalysisOperations.limits] = value;
      },
    );
    await _zeroPoints(
      context,
      function,
      extractFractionInfo,
      extractLogarithmicInfo,
      extractRootInfo,
      extractExponentialInfo,
      extractionTrigonometricInfo,
    ).then(
      (value) {
        print(value);
        result[MathAnalysisOperations.zeroPoints] = value;
      },
    );
    await _derivation(
      context,
      function,
      extractFractionInfo,
      extractLogarithmicInfo,
      extractRootInfo,
      extractExponentialInfo,
      extractionTrigonometricInfo,
    ).then(
      (value) {
        print(value);
        result[MathAnalysisOperations.derivation] = value;
      },
    );
    await _monotony(
      context,
      function,
      extractFractionInfo,
      extractLogarithmicInfo,
      extractRootInfo,
      extractExponentialInfo,
      extractionTrigonometricInfo,
    ).then(
      (value) {
        print(value);
        result[MathAnalysisOperations.monotony] = value;
      },
    );
    await _slope(
      context,
      function,
      extractFractionInfo,
      extractLogarithmicInfo,
      extractRootInfo,
      extractExponentialInfo,
      extractionTrigonometricInfo,
    ).then(
      (value) {
        print(value);
        result[MathAnalysisOperations.slope] = value;
      },
    );
    await _extremePoints(
      context,
      function,
      extractFractionInfo,
      extractLogarithmicInfo,
      extractRootInfo,
      extractExponentialInfo,
      extractionTrigonometricInfo,
    ).then(
      (value) {
        print(value);
        result[MathAnalysisOperations.extremePoints] = value;
      },
    );
    await _curvature(
      context,
      function,
      extractFractionInfo,
      extractLogarithmicInfo,
      extractRootInfo,
      extractExponentialInfo,
      extractionTrigonometricInfo,
    ).then(
      (value) {
        print(value);
        result[MathAnalysisOperations.curvature] = value;
      },
    );
    await _turningPoints(
      context,
      function,
      extractFractionInfo,
      extractLogarithmicInfo,
      extractRootInfo,
      extractExponentialInfo,
      extractionTrigonometricInfo,
    ).then(
      (value) {
        print(value);
        result[MathAnalysisOperations.turningPoint] = value;
      },
    );
    await _integral(
      context,
      function,
      extractFractionInfo,
      extractLogarithmicInfo,
      extractRootInfo,
      extractExponentialInfo,
      extractionTrigonometricInfo,
    ).then(
      (value) {
        print(value);
        result[MathAnalysisOperations.integral] = value;
      },
    );
    return result;
  }

  Future<PreAnalysisResult> _preAnalysis(
    AnalysisContext context,
    Expression function,
    FunctionExtractionResult<FractionResult> extractFractionInfo,
    FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
    FunctionExtractionResult<RootResult> extractRootInfo,
    FunctionExtractionResult<ExponentialResult> extractExponentialInfo,
    FunctionExtractionResult<TrigonometricResult> extractionTrigonometricInfo,
  ) async {
    await Future.delayed(
      Duration(seconds: 1),
    );
    // Powers
    var powers = <String>[];
    extractExponentialInfo.forEach(
      (key, value) {
        powers.add(value.power);
      },
    );
    String? n;
    if (powers.isNotEmpty) {
      n = powers.reduce(
        (value, element) =>
            int.parse(value) > int.parse(element) ? value : element,
      );
    }
    int parsedN = int.parse(n ?? '0');
    var organizedNMap = _getBaseAndPower(
      parsedN,
      extractExponentialInfo,
    );
    Expression f1 = function.derive(defaultVariable).simplify();
    Expression f2 = f1.derive(defaultVariable).simplify();
    Expression f3 = f2.derive(defaultVariable).simplify();
    //
    return (
      n: parsedN,
      organizedNMap: organizedNMap,
      f1: f1,
      f2: f2,
      f3: f3,
    );
  }

  Map<int, List<String>> _getBaseAndPower(
    int n,
    FunctionExtractionResult<ExponentialResult> extractInfo,
  ) {
    var result = <int, List<String>>{};
    if (n > 0 || n < 0) {
      extractInfo.forEach(
        (key, value) {
          var power = (value).power;
          if (power.isNumber && !power.isDecimal) {
            if (result[int.parse(power)] == null) {
              result[int.parse(power)] = <String>[];
            }
            result[int.parse(power)]!.add(
              (extractInfo[key])?.base ?? '0',
            );
          }
        },
      );
    } else if (n == 0) {
      if (extractInfo[0] != null) {
        result[0] = <String>[
          (extractInfo[0] as FractionResult?)?.denominator ?? '0',
        ];
      }
    }
    return result;
  }

  // Definition Set

  Future<DefinitionSetResult> _definitionSet(
    AnalysisContext context,
    Expression function,
    FunctionExtractionResult<FractionResult> extractFractionInfo,
    FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
    FunctionExtractionResult<RootResult> extractRootInfo,
    FunctionExtractionResult<ExponentialResult> extractExponentialInfo,
    FunctionExtractionResult<TrigonometricResult> extractionTrigonometricInfo,
  ) async {
    var result = <int, List<double>>{};
    var uniqueFractionInvalidNumbers = <double>{};
    extractFractionInfo.forEach(
      (key, value) {
        String denominator = value.denominator;
        Newton n = Newton(
          function: denominator,
          x0: defaultGuess,
        );
        var solutions = n.solve();
        result[key] = solutions.guesses;
        uniqueFractionInvalidNumbers.addAll(solutions.guesses);
      },
    );
    var uniqueLogarithmicInvalidNumbers = <double>{};
    extractLogarithmicInfo.forEach(
      (key, value) {
        String resultValue = value.result;
        Newton n = Newton(
          function: resultValue,
          x0: defaultGuess,
        );
        var solutions = n.solve();
        result[key] = solutions.guesses;
        uniqueLogarithmicInvalidNumbers.addAll(solutions.guesses);
      },
    );
    var uniqueRootInvalidNumbers = <double>{};
    extractRootInfo.forEach(
      (key, value) {
        String rootValue = value.value;
        Newton n = Newton(
          function: rootValue,
          x0: defaultGuess,
        );
        var solutions = n.solve();
        result[key] = solutions.guesses;
        uniqueRootInvalidNumbers.addAll(solutions.guesses);
      },
    );
    var invalidNumbersResult = <double>{};
    invalidNumbersResult.addAll(uniqueFractionInvalidNumbers);
    invalidNumbersResult.addAll(uniqueLogarithmicInvalidNumbers);
    invalidNumbersResult.addAll(uniqueRootInvalidNumbers);
    return (
      variable: defaultVariable,
      invalidNumbers: invalidNumbersResult,
      sub: context.variableLimits.sub,
      pow: context.variableLimits.pow,
      output: '''
          ${context.validNumbers.keyword}_{${context.variableLimits.sub}}^{${context.variableLimits.pow}}
          ${invalidNumbersResult.isNotEmpty ? invalidNumbersResult.toString() : ''}
          '''
          .trim(),
      seperateInvalidNumbers: <DefinitionSetValidationScenario, Set<double>>{
        DefinitionSetValidationScenario.fraction: uniqueFractionInvalidNumbers,
        DefinitionSetValidationScenario.logarithmic:
            uniqueLogarithmicInvalidNumbers,
        DefinitionSetValidationScenario.root: uniqueRootInvalidNumbers,
      },
    );
  }

  Future<AsymptotesResult> _asymptotes(
    AnalysisContext context,
    Expression function,
    FunctionExtractionResult<FractionResult> extractFractionInfo,
    FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
    FunctionExtractionResult<RootResult> extractRootInfo,
    FunctionExtractionResult<ExponentialResult> extractExponentialInfo,
    FunctionExtractionResult<TrigonometricResult> extractionTrigonometricInfo, {
    required DefinitionSetResult definitionSetResult,
  }) async {
    var horizontalAsymptotes = <double>[];
    var verticalAsymptotes = <double>[];
    var obliqueAsymptotes = <String>[];
    var curvedAsymptotes = <String>[];
    extractFractionInfo.forEach(
      (key, value) {},
    );
    return (
      horizontalAsymptotes: horizontalAsymptotes,
      verticalAsymptotes: verticalAsymptotes,
      obliqueAsymptotes: obliqueAsymptotes,
      curvedAsymptotes: curvedAsymptotes,
    );
  }

  //

  Future<SetOfValuesResult> _setOfValues(
    AnalysisContext context,
    Expression function,
    FunctionExtractionResult<FractionResult> extractFractionInfo,
    FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
    FunctionExtractionResult<RootResult> extractRootInfo,
    FunctionExtractionResult<ExponentialResult> extractExponentialInfo,
    FunctionExtractionResult<TrigonometricResult> extractionTrigonometricInfo,
  ) async {
    throw UnimplementedError();
  }

  Future<LimitsResult> _limits(
    AnalysisContext context,
    Expression function,
    FunctionExtractionResult<FractionResult> extractFractionInfo,
    FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
    FunctionExtractionResult<RootResult> extractRootInfo,
    FunctionExtractionResult<ExponentialResult> extractExponentialInfo,
    FunctionExtractionResult<TrigonometricResult> extractionTrigonometricInfo,
  ) async {
    throw UnimplementedError();
  }

  Future<ZeroPointsResult> _zeroPoints(
    AnalysisContext context,
    Expression function,
    FunctionExtractionResult<FractionResult> extractFractionInfo,
    FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
    FunctionExtractionResult<RootResult> extractRootInfo,
    FunctionExtractionResult<ExponentialResult> extractExponentialInfo,
    FunctionExtractionResult<TrigonometricResult> extractionTrigonometricInfo,
  ) async {
    throw UnimplementedError();
  }

  Future<DerivationResult> _derivation(
    AnalysisContext context,
    Expression function,
    FunctionExtractionResult<FractionResult> extractFractionInfo,
    FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
    FunctionExtractionResult<RootResult> extractRootInfo,
    FunctionExtractionResult<ExponentialResult> extractExponentialInfo,
    FunctionExtractionResult<TrigonometricResult> extractionTrigonometricInfo,
  ) async {
    throw UnimplementedError();
  }

  Future<MonotonyResult> _monotony(
    AnalysisContext context,
    Expression function,
    FunctionExtractionResult<FractionResult> extractFractionInfo,
    FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
    FunctionExtractionResult<RootResult> extractRootInfo,
    FunctionExtractionResult<ExponentialResult> extractExponentialInfo,
    FunctionExtractionResult<TrigonometricResult> extractionTrigonometricInfo,
  ) async {
    throw UnimplementedError();
  }

  Future<SlopeResult> _slope(
    AnalysisContext context,
    Expression function,
    FunctionExtractionResult<FractionResult> extractFractionInfo,
    FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
    FunctionExtractionResult<RootResult> extractRootInfo,
    FunctionExtractionResult<ExponentialResult> extractExponentialInfo,
    FunctionExtractionResult<TrigonometricResult> extractionTrigonometricInfo,
  ) async {
    throw UnimplementedError();
  }

  Future<ExtremePointsResult> _extremePoints(
    AnalysisContext context,
    Expression function,
    FunctionExtractionResult<FractionResult> extractFractionInfo,
    FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
    FunctionExtractionResult<RootResult> extractRootInfo,
    FunctionExtractionResult<ExponentialResult> extractExponentialInfo,
    FunctionExtractionResult<TrigonometricResult> extractionTrigonometricInfo,
  ) async {
    throw UnimplementedError();
  }

  Future<CurvatureResult> _curvature(
    AnalysisContext context,
    Expression function,
    FunctionExtractionResult<FractionResult> extractFractionInfo,
    FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
    FunctionExtractionResult<RootResult> extractRootInfo,
    FunctionExtractionResult<ExponentialResult> extractExponentialInfo,
    FunctionExtractionResult<TrigonometricResult> extractionTrigonometricInfo,
  ) async {
    throw UnimplementedError();
  }

  Future<TurningPointResult> _turningPoints(
    AnalysisContext context,
    Expression function,
    FunctionExtractionResult<FractionResult> extractFractionInfo,
    FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
    FunctionExtractionResult<RootResult> extractRootInfo,
    FunctionExtractionResult<ExponentialResult> extractExponentialInfo,
    FunctionExtractionResult<TrigonometricResult> extractionTrigonometricInfo,
  ) async {
    throw UnimplementedError();
  }

  Future<IntegralResult> _integral(
    AnalysisContext context,
    Expression function,
    FunctionExtractionResult<FractionResult> extractFractionInfo,
    FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo,
    FunctionExtractionResult<RootResult> extractRootInfo,
    FunctionExtractionResult<ExponentialResult> extractExponentialInfo,
    FunctionExtractionResult<TrigonometricResult> extractionTrigonometricInfo,
  ) async {
    throw UnimplementedError();
  }
}

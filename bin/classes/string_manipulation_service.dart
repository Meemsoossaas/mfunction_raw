part of 'classes.dart';

mixin class StringManipulationService {
  static final StringManipulationService instance =
      StringManipulationService._internal();

  factory StringManipulationService() => instance;

  StringManipulationService._internal();

  Map<int, String> getComponents(String function) {
    Iterable<Match> matches = regexps.fullFunctionRegex.allMatches(function);
    List<String> tokens = matches.map((match) => match.group(0)!).toList();
    return tokens.asMap();
  }

  ComponentType getType(String component) {
    component.trim();
    if (component.isVariable) {
      switch (component) {
        case constants.euler:
          return ComponentType.euler;
        case MathAnalysisService.defaultVariable:
          return ComponentType.focusedVariable;
        default:
          return ComponentType.variableConstant;
      }
    } else if (component.isNumber) {
      return ComponentType.number;
    } else if (component.isPi) {
      return ComponentType.pi;
    } else if (component.isTrigonometric) {
      return ComponentType.trigonometric;
    } else if (component.isLogarithmic) {
      return ComponentType.logarithmic;
    } else if (component.isMathOperator) {
      return ComponentType.mathOperator;
    } else if (component.isBracket) {
      return ComponentType.parentheses;
    } else {
      throw Exception();
    }
  }

  List<String> setUniversalIndexedMathOperators(
    Map<int, ComponentCombination> componentTypes,
  ) {
    var result = <String>[];
    componentTypes.forEach(
      (_, value) {
        if (value.type == ComponentType.mathOperator &&
            value.component != constants.divideBy) {
          result.add(value.component);
        }
      },
    );
    return result;
  }

  List<String> extractBrackets(String function) {
    Iterable<Match> matches = regexps.bracketRegex.allMatches(function);
    return matches.map((match) => match.group(0)!).toList();
  }

  Map<int, String> findFractions(String function) {
    Iterable<RegExpMatch> matches = regexps.fractionRegex.allMatches(function);
    var fractions = <int, String>{};
    int i = 0;
    for (RegExpMatch match in matches) {
      String fraction = match.group(0)!;
      if (fraction.contains('+') ||
          fraction.contains('-') ||
          fraction.contains('*') ||
          fraction.contains('/') ||
          fraction.contains('^')) {
        fractions[i] = fraction;
      }
      i++;
    }
    return fractions;
  }

  Map<int, String> findLogarithmicExpressions(String function) {
    var result = <String>[];
    Iterable<RegExpMatch> matches =
        regexps.logarithmicRegex.allMatches(function);
    for (RegExpMatch match in matches) {
      result.add(match.group(0)!);
    }
    return result.asMap();
  }

  Map<int, String> findRootExpressions(String function) {
    var result = <String>[];
    Iterable<Match> matches = regexps.rootRegex.allMatches(function);
    for (Match match in matches) {
      result.add(match.group(0)!);
    }
    return result.asMap();
  }

  Map<int, String> findExponentialExpressions(String function) {
    var result = <String>[];
    Iterable<Match> matches = regexps.exponentialRegex.allMatches(function);
    for (Match match in matches) {
      result.add(match.group(0)!);
    }
    return result.asMap();
  }

  Map<int, String> findTrigonometricExpression(String function) {
    var result = <String>[];
    Iterable<Match> matches = regexps.trigonometricRegex.allMatches(function);
    for (Match match in matches) {
      result.add(match.group(0)!);
    }
    return result.asMap();
  }

  FunctionExtractionResult<FractionResult> extractFractionInfo(
    Map<int, String> fractions,
  ) {
    var result = <int, FractionResult>{};
    fractions.forEach(
      (key, value) {
        List<String> parts = value.split(constants.divideBy);
        String numerator = parts[0].substring(1);
        String denominator = parts[1].substring(0, parts[1].length - 1);
        result[key] = (
          numerator: numerator,
          denominator: denominator,
        );
      },
    );
    return result;
  }

  FunctionExtractionResult<LogarithmicResult> extractLogarithmicInfo(
    Map<int, String> logarithmicExpressions,
  ) {
    var result = <int, LogarithmicResult>{};
    logarithmicExpressions.forEach(
      (key, value) {
        Match? match = regexps.logarithmicRegex.firstMatch(value);
        if (match != null) {
          String logarithmicKeyword = match.group(1)!;
          String base;
          if (logarithmicKeyword == 'lg') {
            base = "10";
          } else if (logarithmicKeyword == 'ln') {
            base = math.e.toString();
          } else {
            base = match.group(2)!;
          }
          String logarithmicResult = match.group(3)!;
          result[key] = (
            base: base,
            result: logarithmicResult,
          );
        } else {
          throw Exception();
        }
      },
    );
    return result;
  }

  FunctionExtractionResult<RootResult> extractRootInfo(
    Map<int, String> rootExpressions,
  ) {
    var result = <int, RootResult>{};
    rootExpressions.forEach(
      (key, value) {
        Iterable<Match> matches = regexps.rootRegex.allMatches(value);
        for (Match match in matches) {
          String n = match.group(1) ?? '2';
          String rootValue =
              match.group(3) ?? match.group(2) ?? match.group(4) ?? '0';
          if (n == '2' && match.group(1) != null) {
            rootValue = match.group(1)!;
          }
          result[key] = (
            n: n,
            value: rootValue,
          );
        }
      },
    );
    return result;
  }

  FunctionExtractionResult<ExponentialResult> extractExponentialInfo(
    Map<int, String> exponentialExpressions,
  ) {
    var result = <int, ExponentialResult>{};
    exponentialExpressions.forEach(
      (key, value) {
        List<String> parts = value.split(constants.power);
        String base = parts[0].substring(1);
        String power = parts[1].substring(0, parts[1].length - 1);
        result[key] = (
          base: base,
          power: power,
        );
      },
    );
    return result;
  }

  FunctionExtractionResult<TrigonometricResult> extractTrigonometricInfo(
    Map<int, String> trigonometricExpressions,
  ) {
    var result = <int, TrigonometricResult>{};
    trigonometricExpressions.forEach(
      (key, value) {
        Iterable<Match> matches = regexps.trigonometricRegex.allMatches(value);
        for (Match match in matches) {
          String keyword = match.group(2)!;
          String exponent = match.group(3) ?? "1";
          String innerContent = match.group(4)!;
          result[key] = (
            keyword: keyword,
            exponent: exponent,
            innerContent: innerContent,
          ) as TrigonometricResult;
        }
      },
    );
    return result;
  }

  @Deprecated('')
  List<String> assembleFinalComponents() {
    throw Exception();
  }
}

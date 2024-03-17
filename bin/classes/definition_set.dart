part of 'classes.dart';

final class DefinitionSet extends Equatable with LatexHandler {
  final AnalysisContext context;
  final DefinitionSetResult result;

  const DefinitionSet({
    required this.result,
    this.context = const AnalysisContext.currentDefault(),
  });

  String get variable => result.variable;

  List<String> get invalidNumbers => result.invalidNumbers;

  String get sub => result.sub;

  String get pow => result.pow;

  String get output => result.output;

  @override
  String get latexExpression {
    if (invalidNumbers.isEmpty) {
      return decorate(
        context,
        output,
      );
    } else {
      var invalidNumbersAsString = invalidNumbers.toString();
      var numbers = invalidNumbersAsString.substring(
          1, invalidNumbersAsString.length - 1);
      return decorate(
        context,
        "$output \\ {$numbers}",
      );
    }
  }

  @override
  String decorate(
    AnalysisContext context,
    String output,
  ) {
    return "${LaTexCode.definitionSet}_{${context.functionName}} = $variable ${LaTexCode.elementOf} $output";
  }

  @override
  List<Object?> get props => [result];
}

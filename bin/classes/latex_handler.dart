part of 'classes.dart';

abstract mixin class LatexHandler {
  String get latexExpression;

  String decorate(
    AnalysisContext context,
    String output,
  );
}

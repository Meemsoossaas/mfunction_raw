part of 'typedefs.dart';

typedef AnalysisResult = Map<MathAnalysisOperations, Record>;

typedef DistanceFromZero = ({
  double min,
  double max,
});

typedef PreAnalysisResult = ({
  int n,
  Map<int, List<String>> organizedNMap,
  Expression f1,
  Expression f2,
  Expression f3,
});

typedef DefinitionSetResult = ({
  String variable,
  Set<double> invalidNumbers,
  String sub,
  String pow,
  String output,
  Map<DefinitionSetValidationScenario, Set<double>> seperateInvalidNumbers
});

typedef SetOfValuesResult = ();

typedef AsymptotesResult = ({
  List<double> horizontalAsymptotes,
  List<double> verticalAsymptotes,
  List<String> obliqueAsymptotes,
  List<String> curvedAsymptotes,
});

typedef LimitsResult = ();

typedef ZeroPointsResult = ();

typedef DerivationResult = ();

typedef MonotonyResult = ();

typedef SlopeResult = ();

typedef ExtremePointsResult = ();

typedef CurvatureResult = ();

typedef TurningPointResult = ();

typedef IntegralResult = ();

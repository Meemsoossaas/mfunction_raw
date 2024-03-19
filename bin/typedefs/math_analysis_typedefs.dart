part of 'typedefs.dart';

typedef DistanceFromZero = ({
  double min,
  double max,
});

typedef PreAnalysisResult = ({
  int n,
  Map<int, List<String>> organizedNMap,
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

typedef AsymptotesResult = ();

typedef LimitsResult = ();

typedef ZeroPointsResult = ();

typedef DerivationResult = ();

typedef MonotonyResult = ();

typedef SlopeResult = ();

typedef ExtremePointsResult = ();

typedef CurvatureResult = ();

typedef TurningPointResult = ();

typedef IntegralResult = ();

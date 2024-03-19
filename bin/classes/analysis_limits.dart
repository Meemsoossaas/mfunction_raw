part of 'classes.dart';

base class AnalysisLimits extends Equatable {
  static final double negativeInfinity = -double.infinity;
  static final double positiveInfinity = -double.infinity;

  final double min;
  final double max;

  const AnalysisLimits({
    this.min = -double.infinity,
    this.max = double.infinity,
  }) : assert(min != max);

  bool get isInfinite =>
      (min == negativeInfinity && max == positiveInfinity) ||
      (min != negativeInfinity && max == positiveInfinity) ||
      (min == negativeInfinity && max != positiveInfinity);

  bool get isFinite => !isInfinite;

  num get range {
    if (isInfinite) {
      return double.infinity;
    } else if (min == double.minPositive && max == double.maxFinite) {
      return double.maxFinite - double.minPositive;
    }
    return math.pow(max - min, 2);
  }

  DistanceFromZero get distanceFromZero => (min: min, max: max);

  IncrementDirection get incrementDirection {
    if (min < max) {
      return IncrementDirection.ascending;
    } else {
      return IncrementDirection.descending;
    }
  }

  AnalysisLimits reversed() => AnalysisLimits(min: max, max: min);

  @override
  List<Object?> get props => [
        min,
        max,
      ];

  @override
  bool? get stringify => true;
}

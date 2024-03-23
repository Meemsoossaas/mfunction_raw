part of 'classes.dart';

mixin class MathIntegralService {
  static final MathIntegralService instance = MathIntegralService._internal();

  factory MathIntegralService() => instance;

  MathIntegralService._internal();

  T definedIntegral<T extends num>(
    SimpsonRule simpsonRule,
  ) {
    final results = simpsonRule.integrate();
    return results.result as T;
  }
}

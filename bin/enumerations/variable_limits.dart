part of 'enumerations.dart';

enum VariableLimits {
  none(
    sub: '',
    pow: '',
  ),
  negative(
    sub: '0 ${LaTexCode.greaterThan}',
    pow: LaTexCode.negativeInfinity,
  ),
  negativeWithZero(
    sub: '0',
    pow: LaTexCode.negativeInfinity,
  ),
  positive(
    sub: '0 ${LaTexCode.greaterThan}',
    pow: LaTexCode.positiveInfinity,
  ),
  positiveWithZero(
    sub: '0',
    pow: LaTexCode.positiveInfinity,
  );

  final String sub;
  final String pow;

  const VariableLimits({
    required this.sub,
    required this.pow,
  });
}

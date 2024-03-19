part of 'enumerations.dart';

enum NumberTypes {
  natural(
    keyword: LaTexCode.natural,
  ),
  whole(
    keyword: LaTexCode.whole,
  ),
  integer(
    keyword: LaTexCode.integer,
  ),
  rational(
    keyword: LaTexCode.rational,
  ),
  real(
    keyword: LaTexCode.real,
  ),
  complex(
    keyword: LaTexCode.complex,
  );

  final String keyword;

  const NumberTypes({
    required this.keyword,
  });
}

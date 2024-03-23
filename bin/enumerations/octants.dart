part of 'enumerations.dart';

enum Octants {
  i(),
  ii(),
  iii(),
  iv(),
  v(),
  vi(),
  vii(),
  viii();

  bool containedIn<T extends Vector>(
    T vector,
  ) =>
      switch (vector) {
        Vector2D() =>
          ((this == i) || (this == ii) || (this == iii) || (this == iv))
              ? true
              : false,
        Vector3D() => ((this == i) ||
                (this == ii) ||
                (this == iii) ||
                (this == iv) ||
                (this == v) ||
                (this == vi) ||
                (this == vii) ||
                (this == viii))
            ? true
            : false,
      };

  const Octants();
}

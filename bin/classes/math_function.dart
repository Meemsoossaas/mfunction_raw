part of 'classes.dart';

/// MFunction's interpretation of a math function

final class MathFunction extends Equatable with StringManipulationService {
  final String functionSequence;

  const MathFunction(
    this.functionSequence,
  );

  Map<int, String> get components => getComponents(functionSequence);

  Map<int, ComponentCombination> get componentTypes {
    var result = <int, ComponentCombination>{};
    components.forEach(
      (key, value) {
        ComponentType type = getType(value);
        result[key] = (type: type, component: value);
      },
    );
    return result;
  }

  @override
  List<Object?> get props => [
        functionSequence,
      ];
}

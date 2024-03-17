part of 'classes.dart';

final class MathFunction extends Equatable with StringManipulationService {
  final String functionSequence;

  const MathFunction(
    this.functionSequence,
  );

  List<String> get components => getComponents(functionSequence);

  Map<int, ComponentCombination> get componentTypes {
    var result = <int, ComponentCombination>{};
    components.asMap().forEach(
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

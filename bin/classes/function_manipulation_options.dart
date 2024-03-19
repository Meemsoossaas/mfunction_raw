part of 'classes.dart';

sealed class FunctionManipulationOptions extends Equatable {
  const FunctionManipulationOptions();

  FunctionModificationType get modificationType;
}

final class AddOptions implements FunctionManipulationOptions {
  final Map<ComponentType, String> compoundsToBeAdded;
  final FilteringComponents prefix;
  final FilteringComponents infix;
  final FilteringComponents suffix;

  const AddOptions(
    this.compoundsToBeAdded, {
    required this.prefix,
    required this.infix,
    required this.suffix,
  });

  Map<ComponentType, String> get filteredPrefixList => _filter(
        (index, value) => prefix(index, value),
      );

  Map<ComponentType, String> get filteredInfixList => _filter(
        (index, value) => infix(index, value),
      );

  Map<ComponentType, String> get filteredSuffixList => _filter(
        (index, value) => suffix(index, value),
      );

  Map<ComponentType, String> _filter(
    bool Function(ComponentType index, String value) fix,
  ) {
    var result = <ComponentType, String>{};
    compoundsToBeAdded.forEach(
      (key, value) {
        if (fix(key, value)) {
          result[key] = value;
        }
      },
    );
    return result;
  }

  @override
  FunctionModificationType get modificationType => FunctionModificationType.add;

  @override
  List<Object?> get props => [
        compoundsToBeAdded,
        prefix,
        infix,
        suffix,
      ];

  @override
  bool? get stringify => true;
}

final class ReplaceOptions implements FunctionManipulationOptions {
  final List<String> replaceTarget;
  final List<String> replacements;
  final bool growable;
  final OnReplacementCallback? onReplacementCallback;

  const ReplaceOptions(
    this.replaceTarget,
    this.replacements, {
    this.growable = false,
    this.onReplacementCallback,
  });

  @override
  FunctionModificationType get modificationType =>
      FunctionModificationType.replace;

  @override
  List<Object?> get props => [
        replaceTarget,
        replacements,
        growable,
      ];

  @override
  bool? get stringify => true;
}

final class DeleteOptions implements FunctionManipulationOptions {
  final List<String> replaceTarget;
  final List<String> replacements;

  const DeleteOptions(
    this.replaceTarget,
    this.replacements,
  );

  @override
  FunctionModificationType get modificationType =>
      FunctionModificationType.delete;

  @override
  List<Object?> get props => [
        replaceTarget,
        replacements,
      ];

  @override
  bool? get stringify => true;
}

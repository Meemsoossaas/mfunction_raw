part of 'extensions.dart';

extension ListMethodExtensions on List {
  Map<T, int> findDuplicates<T>() {
    final Map<T, int> frequencyMap = {};
    final Map<T, int> duplicates = {};

    for (final item in this) {
      frequencyMap[item] = (frequencyMap[item] ?? 0) + 1;
      if (frequencyMap[item] == 2) {
        duplicates[item] = 2;
      } else if (frequencyMap[item]! > 2) {
        duplicates[item] = frequencyMap[item]!;
      }
    }

    return duplicates;
  }

  int countOccurrencesOf<T>(String targetValue) {
    int count = 0;
    for (T value in this) {
      if (value == targetValue) {
        count++;
      }
    }
    return count;
  }
}

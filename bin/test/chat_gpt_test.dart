void main() {
  List<String> values = ['a', 'b', 'c', 'a', 'b', 'a'];
  Map<String, int> counts = countOccurrences(values);
  print('Occurrences: $counts');
}

Map<String, int> countOccurrences(List<String> values) {
  Map<String, int> counts = {};
  for (String value in values) {
    if (counts.containsKey(value)) {
      counts[value] = counts[value]! + 1;
    } else {
      counts[value] = 1;
    }
  }
  return counts;
}

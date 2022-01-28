extension ListExt<T> on List<T> {
  int findOccurrences(T value) {
    var foundOccurences = where((element) => element == value);
    return foundOccurences.length;
  }
}

extension DigitsOf on int {
  Iterable<int> digitsOf(int number) sync* {
    var base = 1;
    while (base * 10 < number) {
      base = base * 10;
    }
    do {
      var digit = number ~/ base;
      yield digit;
      number = (number - digit * base) * 10;
    } while (number != 0);
  }
}

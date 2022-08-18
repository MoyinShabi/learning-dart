extension SimpleParsing on String {
  int? toIntOrNull() => int.tryParse(this);
  // `this` is the value of the string itself.
}

extension ComplexParsing on String {
  int? toIntTimesTwoOrNull() {
    final number = int.tryParse(this);
    if (number == null) {
      return null;
    }
    return number * 2;
  }
}

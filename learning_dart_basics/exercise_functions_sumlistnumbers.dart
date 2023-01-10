void main() {
  double sum1 = sum([]);
  print(sum1); // 0.0
  double sum2 = sum([1, 2]);
  print(sum2); // 3.0
  double sum3 = sum([1, 2, 3, 4]);
  print(sum3); // 10.0
  print(sum([1, 2])); // 3.0
  print(sum([2.8, 2.4]).toStringAsFixed(3)); // 5.200
  print(sum([5, 6])); // 11.0
  print(sum([5, 6]).toStringAsFixed(4)); // 11.0000
}

double sum(List<double> values) {
  var total = 0.0;
  for (var value in values) {
    total += value;
  }
  return total;
}

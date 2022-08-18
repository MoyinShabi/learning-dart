void main(List<String> args) {
  final list = [1, 2, 3, 4];
  final list2 = [5.1, 2.4, 4.0, 1.1];
  print('--1--');
  final result = where<int>(list, (x) => x.isOdd);
  print(result);
  final result2 = where<double>(list2, (x) => x % 2 == 0);
  print(result2);

  print('--2--');
  final result3 = firstWhere(list, (e) => e == 5, orElse: () => -1);
  print(result3);
  final result4 = firstWhere(list, (e) => e == 2, orElse: () => -1);
  print(result4);
}

List<T> where<T>(List<T> items, bool Function(T) f) {
  var filtered = <T>[];
  for (var item in items) {
    if (f(item)) {
      filtered.add(item);
    }
  }
  return filtered;
}

T firstWhere<T>(List<T> items, bool Function(T) f, {required T Function() orElse}) {
  for (var item in items) {
    if (f(item)) {
      return item;
    }
  }
  return orElse(); // This only takes place if the condition above is `false`.
}

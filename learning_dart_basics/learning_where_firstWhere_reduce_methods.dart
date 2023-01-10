void main(List<String> args) {
  const numbers = [1, 2, 3, 4, 5, 6];

  // The `where()` and `firstWhere()` methods are used to filter and find items inside a collection. A custom filtering logic can be provided using an anonymous function that returns a `bool` value.

  // `where()` METHOD- It gives a concise way of performing some filtering operations on a list without having to write a `for-in` loop manually. (Read Doc).
  print('--1--');
  final even = numbers.where((element) => element % 2 == 0);
  print(even);
  final odd = numbers.where((element) => element.isOdd);
  print(odd);

  // `firstWhere()` METHOD- It is used to get the first item that matches a certain condition.
  print('--2--');
  final value = numbers.firstWhere((element) => element.isEven);
  print(value);
  final value1 = numbers.firstWhere(
    (element) => element == 7,
    orElse: () => -1, // `orElse` is a named argument which is an anonymous function that doesn't have any arguments but returns a value if the result of the first argument in the `firstWhere()` method is `false`.
  );
  print(value1);

  // The `reduce()` method is used to combine all the items inside a list based on some criteria and produce a single result. E.g., calculating the sum of items inside a list.
  final sum = numbers.reduce((current, next) => current + next);
  print(sum);
}

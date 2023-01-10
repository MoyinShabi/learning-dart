void main(List<String> args) {
  const list = [1, 2, 3];
  const list2 = [2.0, 4.0, 6.0];

  final doubles = doubleItems(list);
  print('--1--');
  print(doubles);

  print('--2--');

  final doublesTransform = transform(list, (e) => e * 2); // With the anonymous function, we can specify how we want the items in the list to be transformed.
  print('--3--');
  print(doublesTransform);

  // Repurposing the `transform` function:
  final squaresTransform = transform(list, (e) => e * e);
  print('--4--');
  print(squaresTransform);

  // final doubleTransform1 = transform1(doublesList, (e) => e * 2); // Compile-time error because of null-safety. Basically because the generic type `<T>` of the empty list in the `transform1<T>` function is not guaranteed as non-nullable and with null-safety, we can't multiply numbers that may be `null`.

  // FIX- Adding a type annotation ensuring the code is type-safe and ensuring the type of the variable the result is stored into is `List<double>` and not `List<dynamic>`:
  final doublesTransform1 = transform1<double>(list2, (e) => e * 2);
  print('--5--');
  print(doublesTransform1);

  // The function can now be called explicitly with arguments of different types, e.g:
  final squaresTransform1 = transform1<int>(list, (e) => e * e);
  print('--6--');
  print(squaresTransform1);

  // More generic function calls specifying two types:
  final doublesTransform2 = transform2<int, int>(list, (e) => e * 2);
  print('--7--');
  print(doublesTransform2);

  final roundedTransform = transform2<double, int>(list2, (e) => (e * e).round());
  print('--8--');
  print(roundedTransform);
}

// GENERICS- They are used to write type safe code and reduce code duplication.

// A function that can double all the items inside a list using a `for-loop`:
List<int> doubleItems(List<int> items) {
  var result = <int>[];
  for (var x in items) {
    result.add(x * 2);
  }
  return result;
}

// Delegating the transformation of the items to a function argument to make the function more reusable:
List<int> transform(List<int> items, int Function(int) f) {
  var result = <int>[];
  for (var x in items) {
    result.add(f(x)); // Adding whatever is returned from the `Function` argument of the `Function` parameter, `f`, during each iteration, to the empty list. Remember, `f(x)` is the function call which returns a result.
  }
  return result;
}
// The `transform` function only works with lists of type `int` so an argument of type `List<double>` can't be passed into it. To solve this problem, the function needs to be updated to work with a "generic" type.

// When we want to define a function that uses "generics", we have to specify a generic type after the function name. Generic types always use capital letters of the alphabet (e.g, <T>). When a function is converted to use generics, all the types in it must be updated accordingly.
List<T> transform1<T>(List<T> items, T Function(T) f) {
  var result = <T>[];
  for (var x in items) {
    result.add(f(x));
  }
  return result;
}
// There is still a problem with defining this function like this, because in its case, the input type is `List<T>` and it must be the same as the output type. That means that the function can't be used to round a list of doubles to a list of integers(i.e, returning a result of a different output type).

//FIX- Making the function more generic so that the type of the inputs can be different from the type of the outputs, by adding one additional generic type `<R>`:
List<R> transform2<T, R>(List<T> items, R Function(T) f) {
  var result = <R>[];
  for (var x in items) {
    result.add(f(x));
  }
  return result;
}
// NOTE: From a functional point of view, the `map()` method and the `transform2` function above do exactly the same thing. That is, the `map()` operator uses generics under the hood.
// Take away: We can use function arguments and generics to take code reuse to the next level.

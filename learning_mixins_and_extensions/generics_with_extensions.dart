import 'package:dartx/dartx.dart';

extension IterableX1 on Iterable<int> {
  int sum1() => reduce((value, element) => value + element);
}

extension IterableX2 on Iterable<num> {
  num sum2() => reduce((value, element) => value + element);
}

// Declaring an extension with a generic type constraint:
extension IterableX3<T extends num> on Iterable<T> {
  T sum3() => reduce((value, element) => (value + element) as T);
}

/* NOTE:
  If you create an extension and want it to apply to all subclasses of a 
  specific class, you can use a generic type constraint on that class, e.g.,
  `<T extends num>` above, with `num` being the base class. 
  If you don't specify a base class explicitly, Dart will use `Object` 
  by default meaning that the extension will be valid on any typ, because all 
  classes are subclasses of `Object`.
  So, type constraints are a way to restrict an extension or class to only 
  subclasses of a certain base class.
  
  NOTE: The package, "dartx" available on pub.dev has a lot of useful
  extensions that you can use to work with various classes. */

void main(List<String> args) {
  final sum1 = [1, 2, 3].sum1();
  print(sum1);
  /* final sum2 = [1.0, 2.0, 3.0].sum(); // Compile-time error because 
  the `sum()` function only works on Iterables of type `int`.

  But because `int` and `double` are subclasses of the type `num`, 
  we can update the `IterableX1` extension to work on all instances of type 
  `num` as shown in the `IterableX2` extension. */

  final sum4 = [1.0, 2.0, 3.0].sum3();
  print(sum4);
  final sum5 = [1, 2, 3].sum3();
  print(sum5);

  /*  final sum2 = [1.0, 2.0, 3.0].sum2();
  print(sum2);
  final sum3 = [1, 2, 3].sum2();
  print(sum3); */

  final something = [5, 6, 7].slice(2);
  print(something);
}

// `toString` is a method inside the `Object` class, and it is very useful for debugging purposes. This is because you can override it to define a string representation of your own types (classes).

// This means that you can get a human-readable string representation of complex objects using collections and nested classes, as long as you override the `toString` method in your own classes. The bottom line is that when you create your own classes and you want to print the values of their member variables, it is a good idea to override the `toString` method.

// This is particularly useful when you're defining model classes that represent some objects in the real-world , such as `Person` or an `Employee`.

// All the built in types (int, String, List...) already implement the  `toString` method.

class Point {
  const Point(this.x, this.y);
  final int x;
  final int y;

  @override
  String toString() => 'Point($x, $y)';
}

void main(List<String> args) {
  // print(Point(2, 3)); // Output: Instance of 'Point'. This is because we have not overridden the `toString` method in the class definition.
  print(Point(2, 3)); // Output: Point(2, 3). This is much more useful.

  const list = [
    Point(3, 4),
    Point(4, 5),
  ];
  print(list); // [Point(3, 4), Point(4, 5)]
}

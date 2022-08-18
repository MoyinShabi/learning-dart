class Point {
  const Point(this.x, this.y);
  final int x;
  final int y;

  @override
  String toString() => 'Point($x, $y)';

  // Learning operator overload:
  // Operator overload allows us to define how an operator works when it is applied to a new type (class). In this case, we are interested in the equality operator because that's what we use to compare the objects in the `main` method below.

  // We need to pass an argument of type `Object`, because the equality operator works with two operands. One on the left side and the other on the right side. So in this case, the left-hand side operator is the current instance which already has `x` and `y` variables. And the right-hand side operand is passed as an argument of the parameter `other`. We're normally not allowed to use `Point` as the type of the argument, because the equality operator inside the `Object` class has an argument of type `Object`, and when we override a method or an operator, all the arguments must match.

  // @override
  // bool operator ==(Object other) {
  //   if (other is Point) {
  //     return x == other.x && y == other.y;
  //   }
  //   return false;
  // }

  // To fix this, we can use the `covariant` keyword in the parenthesis, and this will enable us to specify that the argument must be of type `Point` before the operator can be overridden. So by using `covariant`, we are allowed to change the type of an argument when we override a method from a super class.
  @override
  bool operator ==(covariant Point other) {
    return x == other.x && y == other.y;
  }
}

void main(List<String> args) {
  // print(5 == 5); // true
  // print(Point(0, 0) == Point(0, 0)); // false (before overriding the `==` operator)- Because Dart doesn't know how to compare instances of type `Point`. If we want to reliably compare instances of new classes, then we must implement the equality operator.
  print(Point(0, 0) == Point(0, 0)); // true
  // print(Point(0, 0) == 'abc'); // Compile-time error because we've overridden the `==` operator also using the `covariant` keyword as explained above.
}

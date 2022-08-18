import 'dart:math';

abstract class Shape {
  double get area;
  double get perimeter;

  void printValue() {
    print('area: $area');
    print('perimeter: $perimeter');
  }
}

class Square extends Shape {
  Square(this.side);
  final double side;

  @override
  double get area => side * side;

  @override
  double get perimeter => 4 * side;
}

class Circle extends Shape {
  Circle(this.radius);
  final double radius;

  @override
  double get area => pi * radius * radius;

  @override
  double get perimeter => 2 * pi * radius;
}

void main() {
  final circle = Circle(3);
  circle.printValue();

  final square = Square(9);
  square.printValue();

  final shapes = [
    Square(4),
    Circle(5),
  ];

  shapes.forEach(((shape) => shape.printValue()));
}

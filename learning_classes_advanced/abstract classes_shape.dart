import 'dart:math';

// "Abstract classes" are classes that cannot be instantiated. To use one, you have to create a concrete subclass of it.
// Abstract classes allow us to define an interface that can be implemented by various subclasses. This allows us to decouple the code that uses a certain interface, from its implementation.

abstract class Shape {
  double get area;
}

class Square extends Shape {
  Square(this.side);
  final double side;

  @override
  double get area => side * side;
}

class Circle extends Shape {
  Circle(this.radius);
  final double radius;

  @override
  double get area => pi * radius * radius;
}

// Function that can print out the area of the shape:
void printArea(Shape shape) {
  print(shape.area);
}
// NOTE: The `printArea` function doesn't need to know that `Square` and `Circle` even exist. All it needs is an argument of type `Shape`, and uses that to print an area.

// NOTE: By writing the `printArea` function like this, we are following the "Dependency Inversion Principle", which means that we are coding against an abstraction, so that the `printArea` method is completely independent from any implementation of the `Shape` class.

// NOTE: In programming, it's often a good idea to code against abstract interfaces, rather than concrete implementations.

void main(List<String> args) {
  // final shape = Shape(); // Compile-time error because abstract classes can't be instantiated.
  final square = Square(30);
  print(square.area);
  final circle = Circle(20);
  print(circle.area);

  printArea(square); // This is possible because `Square` is a subclass of `Shape`.

  final Shape circle1 = Circle(10); // This works because we can always assign an instance of a subclass to a variable of the parent class(super class).
  printArea(circle1);

  final shapes = [
    Square(5),
    Circle(9),
  ];
  shapes.forEach((shape) {
    printArea(shape);
  });
  // This all works because these objects have a type that is a subclass of `Shape`.
  // OR
  shapes.forEach(printArea);
}

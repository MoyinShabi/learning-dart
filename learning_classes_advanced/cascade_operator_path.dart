// The cascade operator `..` is used to modify class instances with mutable state inside them.
import 'dart:math';

class ClosedPath {
  List<Point> _points = [];

  void moveTo(Point point) {
    _points = [point]; // Sets this variable with a list that contains just one point.
  }

  void lineTo(Point point) {
    _points.add(point); // Adds a new point to the list.
  }
}

void main(List<String> args) {
  final path = ClosedPath();

  // Drawing a square shape using points:
  path.moveTo(Point(0, 0));
  path.lineTo(Point(2, 0));
  path.lineTo(Point(2, 2));
  path.lineTo(Point(0, 2));
  path.lineTo(Point(0, 0));
  // This code works but it's a bit verbose, because we need to type `path`, every time we want to add a segment to our path.

  // THE BETTER WAY USING THE CASCADE OPERATOR `..` :
  // The way it works is that when we have an instance of a `ClosedPath`, then we can type `..` and call one of the methods in the class, and then we can repeat the operation multiple times.

  final path2 = ClosedPath()
    ..moveTo(Point(0, 0))
    ..moveTo(Point(2, 0))
    ..moveTo(Point(2, 2))
    ..moveTo(Point(0, 2))
    ..moveTo(Point(0, 0));
  // This code behaves exactly in the same way as what we had before, and the way it works is that the cascade operator will call the method that we have specified, and this means that we can use this syntax to cascade multiple method calls as shown above.
  // The cascade operator `..` is nothing more than syntactic sugar and it is very common to use it when we have classes that are mutable such as `ClosedPath`, defined above. This operator also has a null-aware variant that we can call as `?..`, and this is useful if it's called on a variable that is "nullable".
}

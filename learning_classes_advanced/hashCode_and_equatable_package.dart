// `hashCode` is an important property that is declared inside the `Object` class.
// NOTE: Two objects that are equal should have the same `hashCode`, and two objects that are not equal should have different `hashCode`s. For this reason, you should always override the `hashCode` getter variable whenever you override the equality `==` operator.

import 'package:equatable/equatable.dart';

class Point extends Equatable {
  const Point(this.x, this.y);
  final int x;
  final int y;

  @override
  List<Object?> get props => [x, y];

  @override
  bool? get stringify => true;

  Point operator +(Point other) {
    return Point(x + other.x, y + other.y);
  }

  Point operator *(int other) {
    return Point(x * other, y * other);
  }
}

void main(List<String> args) {
  print(Point(1, 1));
  print(Point(0, 0) == Point(0, 0));
  print(Point(1, 2) == Point(3, 4));
}

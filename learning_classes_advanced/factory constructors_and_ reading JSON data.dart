/* "Factory Constructors" are useful in two kinds of scenarios:
1. When we need to implement a constructor that doesn't always create a new instance of its class.
That is, regular constructors must return an instance of the class itself, but "Factory constructors" can return an instance of a subclass.

2. When we need to initialize a final variable using logic that can't be handled in the initializer list.

/* NOTE:
  Regular constructors: all final variables must be initialized immediately (as arguments or with the initializer list)

  Factory constructors: can execute any arbitrary logic first, and then return an instance of a subclass or the class itself. 
 */

A good use case for this is when we are parsing some data that comes from the network, and this is typically stored in JSON format. This is a common task that many applications need to do. 
*/

// In Dart, we can represent JSON data using a map of key-value pairs.

/* An Example:
 Consider the `Shape`, `Square` and `Circle` classes that we have implemented a little while ago. And to make things interesting, suppose that we are building a program, that we can use to show different shapes on screen. These shapes can be stored inside a database on the server, and our client application can request a list of shapes to be drawn on screen. When the server receives this request, it sends back a response containing JSON data, which may look like this. And when the client receives this data, it needs to process it and map each item into a Shape instance. And this can be done with a factory constructor.
 */

import 'dart:math';

abstract class Shape {
  const Shape(); // Default constructor explicitly defined, because of the factory constructor.
  double get area;

  factory Shape.fromJson(Map<String, Object> json) {
    /* OR
  static Shape fromJson(Map<String, Object> json) {...} 
  It's possible, and easy to replace the factory constructor with a `static` method that returns an object of type `Shape`. The code will work just fine, however, by convention, when you want to initialize a class instance such as in this case, then it's recommended to use a `factory` constructor.
  */
    final type = json[
        'type']; // Setting a new key-value pair in the empty map, `json`. The value is null so it is of type `Object?`.
    // Using a `switch` statement to decide which kind of instance to return (that is, the instance of which subclass to return):
    switch (type) {
      case 'square':
        final side = json['side'];
        // return Square(side); // Compile-time error - Because it is not guaranteed at compile-time that we have a value for the `side` key, and so the variable `side` could be `null`. And even if it's not `null`, it's not guaranteed to be of type `double` as it should be, from the `Square` subclass below.
        // FIX:
        if (side is double) {
          return Square(
              side); // The factory constructor can return existing instances of the class, or even subclasses of it, as shown here.
        }
        // Throwing an error if we couldn't read the `side` variable and create a `Square(side)` object, because it is `null` or not a double, because we can't return `null`, and the factory constructor has to return a Shape (it will cause an exception that will interrupt the execution of our program):
        throw UnsupportedError(
            'invalid or missing side property of the square');
      case 'circle':
        final radius = json['radius'];
        if (radius is double) {
          return Circle(radius);
        }
        throw UnsupportedError(
            'invalid or missing radius property of the circle');
      case 'parallelogram':
        final base = json['base'];
        final height = json['height'];
        if (base is double && height is double) {
          return Parallelogram(base, height);
        }
        throw UnsupportedError(
            'invalid or missing base or height property of the parallelogram');

      // Handling the case where the type is not a square or circle, which should not be:
      default:
        throw UnimplementedError(
            'shape $type not recognized'); // This is like a warning to cause a check of wrong data in the `shapesJson` list below.
    }
  }
  // NOTE: `Object` is a good choice for the type of the `values` of the `json` `Map` argument, because it is the superclass of all classes in Dart. So, prefer `Object` to `dynamic` when working with maps, because the type system will help more as we do so.

  /* NOTE:
     JSON best practices:
     - Check all edge cases (e.g, the conditional logic above to switch on the type of the shape).
     - Throw an error if the input data is invalid (e.g, the defensive logic above using the `throw` keyword, which ensures that all the values we get are of the correct type).
    
    When reading JSON data that comes from a server, it's a good idea to add all this extra logic, because it makes our code safer to use. 
  */
}

/* NOTE:
   How constructors are generated:

   - If a class doesn't have any constructors, Dart will generate an "implicit" one with no arguments(and because of this, subclasses' constructors don't need to call `super()`).

   - If a class has one or more constructors, the implicit one with no arguments won't be generated (and subclasses' constructors don't have a super constructor that they can use).

   In the case above, we have added a factory constructor, and so the implicit constructor is no longer generated. So, the solution is to "explicitly" define a default constructor for the `Shape` class, which is `Shape();`, as shown above.
 */

class Square extends Shape {
  const Square(this.side);
  final double side;

  @override
  double get area => side * side;
  @override
  String toString() {
    return 'Square of side ${side}m';
  }
}

class Circle extends Shape {
  const Circle(this.radius);
  final double radius;

  @override
  double get area => pi * radius * radius;
  @override
  String toString() {
    return 'Circle of radius ${radius}m';
  }
}

class Parallelogram extends Shape {
  Parallelogram(this.base, this.height);
  final double base;
  final double height;

  @override
  double get area => base * height;
  @override
  String toString() => 'Parallelogram of base ${base}m and height ${height}m';
}

void printArea(Shape shape) {
  print('The area of the $shape is ${shape.area.toStringAsFixed(2)}m');
}

void main(List<String> args) {
  final shapesJson = [
    {
      'type': 'square',
      'side': 10.0,
    },
    {
      'type': 'circle',
      'radius': 5.0,
    },
    {
      'type': 'circle',
      'radius': 20.0,
    },
    {
      'type': 'square',
      'side': 15.0,
    },
    {
      'type': 'parallelogram',
      'base': 5.0,
      'height': 8.0,
    },
    // Testing the error handling logic implemented in the `Shape.fromJson` factory constructor in the `Shape` class above:
    {
      'type': 'triangle', // `'triangle` is not a type that is supported.
      'radius': 20.0,
    },
    // {
    //   'type': 'square',
    // },
  ];
  // Goal: To map all the items into a list of `Shape` objects.

  final shapes = shapesJson.map((shapeJson) => Shape.fromJson(shapeJson));
  // What this does is to take each one of the maps in the `shapesJson` list. and pass it to the `Shape.fromJson` factory constructor defined above. The `map()` method used will then return an iterable of the instances of the subclasses of the `Shape` class returned from the `shapesJson` factory constructor.

  shapes.forEach(printArea); // Prints out each of the areas from the iterable.
}

// "Sub-classing" is a technique that is used to extend the functionality of an existing class to increase code reuse.

// The process of extending an existing class is called "sub-classing" or "inheritance". When we do this, the subclass has access to all the properties and methods of the class that is is extending (the superclass). This defines a class hierarchy as you do so.

// Sub-classing is a tool that you can use to organize your code and model certain concepts in the real-world. As a general principle, it is used to model `IS-A` relationships between objects(e.g, from the example below, `Dog` IS-A `Animal`, `Cow` IS-A `Animal`, and `CleverDog` IS-A `Dog`).

// Superclass
class Animal {
  const Animal({required this.age});

  final int age;

  void sleep() => print('sleep');
  void eat() => print('eat');
  void move() => print('move');
  void printAge() => print('Age: $age');
}

// Extending the `Animal` class:
class Dog extends Animal {
  Dog({required int age}) : super(age: age);
  // This is a call to the constructor in the superclass, `Animal`, inside an initializer list. The value of the required named argument, `age` of the super constructor is the value specified as the argument to the parameter of the `Dog` class constructor.
  // Dog({required super.age});

  void bark() => print('bark');
  // The `Dog` class has access to all the properties and methods of `Animal`. It is a subclass of `Animal`
}

// Extending the `Animal` class again:
class Cow extends Animal {
  Cow({required int age}) : super(age: age);

  void moo() => print('moo');
  void declaration() {
    print('sleep');
  }
  // The `Cow` class has access to all the properties and methods of `Animal`. It is a subclass of `Animal`
}

// Extending the `Dog` class:
class CleverDog extends Dog {
  CleverDog({required int age}) : super(age: age);

  void catchBall() => print('catch');
  // The `CleverDog` class has access to all the properties and methods of both the `Dog` class and the `Animal` class. It is a subclass of `Dog`, which is a subclass of `Animal`.
}

// Learning Overriding methods using `@override`:
// Overrides are used to replace the implementation of a method that is defined inside a superclass with a more specialized version of it.

// NOTE: Method overrides are quite common when we use UI frameworks such as FLutter that define life-cycle events that control your application's state.

class Cat extends Animal {
  Cat({required int age}) : super(age: age);

  void meow() => print('meow');

  // Creating a method with the same name as a method in the superclass:
  // void sleep() => print('cat: sleep'); // When this method is called on an instance of the type `Cat`, `cat: sleep` will be printed, because we have "overridden" the method of the same name in the superclass.

  // Best practice to keep in mind- Add an `@override` annotation instead, when you want to override a method in a superclass:
  @override // This is a declaration of intent
  void sleep() {
    super.sleep(); // Calling the `sleep` method in the superclass.
    print('sleep some more');
  }
}

void main(List<String> args) {
  final animal = Animal(age: 10);
  print('--1--');
  animal.sleep();
  animal.eat();

  final dog = Dog(age: 12);
  print('--2--');
  dog.bark();
  dog.sleep();
  dog.move();

  final cow = Cow(age: 10);
  print('--3--');
  cow.sleep();
  cow.eat();
  cow.moo();

  final cleverDog = CleverDog(age: 10);
  print('--4--');
  cleverDog.bark();
  cleverDog.catchBall();
  cleverDog.move();
  cleverDog.sleep();

  final cat = Cat(age: 10);
  print('--5--');
  cat.sleep();
}

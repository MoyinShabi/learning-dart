abstract class InterfaceA {
  void a();
}

abstract class InterfaceB {
  void b();
}

// In Dart, a new class can "implement" multiple classes or interfaces, using the `implements` keyword and not `extends` (that is, new classes can only extend one class).
class AB implements InterfaceA, InterfaceB {
  @override
  void a() {}

  @override
  void b() {}
}

abstract class Base {
  void foo(); // Abstract method which doesn't have an implementation.
  void bar() => print('bar');
  // Concrete method. This is valid code because when we create a method inside an abstract class, we can choose to provide an implementation, but we don't have to.
}

// When we use the `extends` keyword, we are only required to implement (override) methods that are not implemented in the superclass (abstract methods).
class Subclass extends Base {
  @override
  void foo() {
    print('foo');
  }
}

// When we use the `implements` keyword, we must override all the methods in the superclass, even if they are already implemented in that class (concrete and abstract methods).
class Subclass2 implements Base {
  @override
  void foo() {
    print('foo');
  }

  @override
  void bar() {}
}
// NOTE: If we want, a new class can `implement` a non-abstract class, provided that we override all its methods.

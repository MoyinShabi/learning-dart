/* Mixins also have some drawbacks:
- Mixins can't have constructors which makes sense because we can't instantiate 
  objects of a mixin type. The whole point of a mixin is to "mix-it-in" to other 
  classes.
- Mixins lead to name collisions, because we can define member variables or methods 
  with the same name inside two separate mixins, and this can make things quite
  confusing.*/

mixin Mixin1 {
  int foo = 1;
}

mixin Mixin2 {
  int foo = 2;
}

class Foo with Mixin1, Mixin2 {
  void printFoo() {
    print(foo);
  }
}

void main(List<String> args) {
  final foo = Foo();
  foo.printFoo(); // 2

  /* The output means that we're accessing the variable inside `Mixin2` and not
  `Mixin1` as we can't access the `foo` variable inside it from the `Foo` class.
  So in general, it is not a good idea to create mixins that can lead to name 
  collisions as done above, because if you work on bigger projects that have a 
  lot of mixins, it may be hard to find out that you have a name collision, because
  the compiler doesn't warn you about this.

  NOTE: Deciding on using abstract classes and interfaces or mixins in programs
  depends on the use case, and the benefits and drawbacks of using mixins should
  be considered in such situation.   */
}

/* "Mixins" and "Extensions" are two features of the Dart language 
that make it easier to extend the functionality of existing 
types/classes. 

In Dart, classes can only extend a single class. 
In this context, "mixins" are quite useful because they allow you to overcome this limitation, 
and add functionality and increase code reuse in your class hierarchies.

"Extensions" solve a similar problem but from a different angle. They are also a way to 
add functionality to existing classes, but they can do so without having to modify the original class.
This makes them well suited for extending classes that belong to the Dart SDK, 
as well as code that lives inside separate packages or libraries.
*/

class LivingThing {
  void breathe() => print('breathing');
}

class Fish extends LivingThing {
  void swim() => print('swimming');
}

class Penguin extends LivingThing {
  void swim() => print('swimming');
}

/* We now have some code duplication because we had to implement the same 
'swim()` method in the 'Fish` and `Penguin` classes.
The solution to this is not to move the `swim()` method to the `LivingThing` class, 
because it's definitely not true that all Living things can swim.
Also, it doesn't seem right to add another superclass that is shared by both
the `Fish` and `LivingThing` classes so that they can both 'swim'.
This is an example where mixins come handy */

// SOLUTION

// Mixin:
mixin Swimming {
  void swim() => print('swimming');
}

/* By declaring the mixin `Swimming`, we no longer have code duplication and
in order to achieve this, we didn't have to change the original class hierarchy (sub-classing) in any way.
So, "mixins" give us a convenient way of sharing functionality between multiple classes
in a flexible way, without code duplication. */

mixin Breathing {
  void breathe() => print('breathing');
}

class LivingThing2 with Breathing {}

class Fish2 extends LivingThing2 with Swimming {}

class Penguin2 extends LivingThing2 with Swimming {}

class Plant with Breathing {}
/* By structuring things this way, we're defining a set of behaviors using 
"mixins", rather than hardcoding these behaviors inside classes themselves, 
and this leads to code that is easier to maintain.

NOTE:
- Mixins are good for defining "behaviors" (or capabilities).
- Classes can inherit those behaviors in a more maintainable way.
- Mixins lead to more "shallow" class hierarchies which is a good thing
- Instead, if we don't use mixins and only rely on single inheritance (`extends`),
  it will most likely lead to "deep" class hierarchies which makes the code 
  harder to maintain.
- In Dart, any class declared using the `class` keyword can be added as a mixin
  to another class, using the `with` keyword.
- The difference between a "mixin" and a class is that "a mixin can't be instantiated."
  That is, we can't create instances of types declared as a `mixin`.
- Remember, when we create classes, we use "nouns" and not verbs (most suitable for mixins).*/

void main(List<String> args) {
  final fish = Fish2();
  fish.swim();
  fish.breathe();
  final penguin = Penguin2();
  penguin.swim();
  penguin.breathe();
}

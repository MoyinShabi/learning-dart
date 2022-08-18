// Using a class to model a person.
class Person {
  // Class constructors
  Person({required this.name, required this.age, required this.height});

  // Properties
  final String name;
  final int age;
  final double height;

  // Method
  void printDescription() {
    print("My name is $name. I'm $age years old, I'm $height meters tall.");
  }
}

void main(List<String> args) {
  final person1 = Person(name: 'Moyin', age: 20, height: 1.64);
  person1.printDescription();

  final person2 = Person(name: 'Temi', age: 20, height: 1.6);
  person2.printDescription();
}

//  NOTE: Whenever you're trying to represent some real-world concepts, and you know that they have some well-defined properties, such as name, age, and height, then you should use classes. The type system in classes should be used to your advantage in order to avoid many mistakes that would otherwise be hard to catch when you use a Map, for example. 

// NOTE: Classes are self documenting, and people reading your code can more easily understand how to use it correctly as long as they are well designed.
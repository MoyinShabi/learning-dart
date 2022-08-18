class Person {
  Person({required this.name, required this.age});
  final String name;
  final int age;

  factory Person.fromJson(Map<String, Object> json) {
    final name = json['name'];
    final age = json['age'];
    if (name is String && age is int) {
      return Person(name: name, age: age);
    }
    throw StateError('invalid or missing name or age property');
  }

  Map<String, Object> toJson() => {
        'name': name,
        'age': age,
      };
  // A use case for the `toJson()` method is that sometimes we want to save some data to a remote database. And to do that, we need to be able to represent our data in JSON format.

  @override
  String toString() {
    return 'Person(name: $name, age: $age)';
  }
}

void main() {
  final person = Person.fromJson({
    'name': 'Andrea',
    'age': 36,
  });
  print(person);

  final json = person.toJson();
  print(json);
}

void main() {
  var emptyMap1 = Map();
  print('--1--');
  print(emptyMap1); // {}

  var emptyMap2 = <String, int>{}; // Type annotation which is safe
  print('--2--');
  print(emptyMap2); // {}

  Map<String, String> emptyMap3 = {};
  print('--3--');
  print(emptyMap3); // {}

  var person = <String, dynamic>{
    'name': 'Moyin',
    'age': 19,
    'height': 1.84,
  };
  print('--4--');
  print(person); // {name: Moyin, age: 19, height: 1.84}

  // Accessing a value in the Map:
  print('--5--');
  print(person['age']); // 19

  print('--6--');
  print(person['name']); // Moyin
  var name = person['name'] as String;
  // This tells Dart to infer the variable as a String so it can have access to all its methods. Without doing so, the variable is of type `dynamic`.

  print('--7--');
  print(name); // Moyin
  /*
  If you declare a map with dynamic values
  and want to assign map value to variables of a specific type,
  you can use the `as` operator.
  */

  // Setting a value in a specific key:
  person['age'] = 20;
  person['likesPizza'] = true; // Adding a new key-value pair

  print('--8--');
  print(person); // {name: Moyin, age: 20, height: 1.84, likesPizza: true}

  print('--9--');
  print("Keys: ${person.keys}"); // Keys: (name, age, height, likesPizza)

  print('--10--');
  print("Values: ${person.values}"); // Values: (Moyin, 20, 1.84, true)

  print('--11--');
  print(person.entries);
  // (MapEntry(name: Moyin), MapEntry(age: 20), MapEntry(height: 1.84), MapEntry(likesPizza: true))

  print(person.entries.map((e) => "Key: ${e.key}").toSet());
  // {Key: name, Key: age, Key: height, Key: likesPizza}

  print(person.entries.map((e) => ("Key: ${e.key}")).toSet());
  // {Key: name, Key: age, Key: height, Key: likesPizza}

  print(person.entries.map((e) => (e.key)).toSet());
  // {name, age, height, likesPizza}

  print(person.entries.map((e) => e.key).toSet());
  // {name, age, height, likesPizza}
  // This shows that the parenthesis for the statement/expression is optional

  print(person.keys.toSet());

  // Iterating through all the keys in the map:
  print('--12--');
  for (var key in person.keys) {
    print(key);
  }
// name
// age
// height
// likesPizza

  // Iterating through all the values in the map:
  print('--13--');
  for (var key in person.keys) {
    print(person[key]);
  }
// Moyin
// 20
// 1.84
// true

  // OR
  print('--14--');
  for (var value in person.values) {
    print(value);
  }

// Another way to iterate through the keys and values in a map:
  print('--15--');
  for (var entry in person.entries) {
    print("${entry.key}: ${entry.value}");
  }
// name: Moyin
// age: 20
// height: 1.84
// likesPizza: true
}

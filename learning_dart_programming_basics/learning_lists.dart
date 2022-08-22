void main() {
  //Creating a list
  List<String> listName1 = [];
  print(listName1);
  var listName2 = <String>[]; //Type annotation which is safe
  print(listName2);

  var cities = <String>['London', 'Paris', 'Moscow'];
  print(cities); //[London, Paris, Moscow]
  print(cities[1]); //Paris
  print(cities[0]); //London
  cities[1] = 'Rome'; //Changing an item in the list
  print(cities); //London, Rome, Moscow]
  print(cities[1]); //Rome

  ///Iterating through all the items in the list
  //Using a for-in loop
  for (var city in cities) {
    print(city);
  }
  //London
  //Rome
  //Moscow

  //Using the conventional for-loop
  for (var i = 0; i < cities.length; i++) {
    print(cities[i]);
  }

  //Using the forEach() method
  cities.forEach((city) => print(city));

  var fruits = <String>['Orange', 'Apple', 'Mango', 'Pineapple'];
  //Basic Properties
  print(fruits.length);
  print(fruits.isEmpty);
  print(fruits.isNotEmpty);
  print([].isEmpty);
  print([].isNotEmpty);
  print(fruits.first);
  print(fruits.last);
  print(fruits.reversed);
  print(fruits.runtimeType);
  // print([].first); //Error

  //Basic Methods
  fruits.add('Banana');
  print(fruits);
  fruits.addAll(['Avocado', 'Mango', 'Tangarine']);
  print(fruits);
  fruits.insert(1, 'Pawpaw');
  print(fruits);
  fruits.insertAll(2, ['Grape', 'Strawberry']);
  print(fruits);
  print(fruits.contains('Pineapple'));
  print(fruits.indexOf('Grape'));
  print(fruits.any((i) => i.contains('apple')));
  print(fruits.elementAt(3));
  print(fruits.take(4).toList());
  fruits.remove('Mango');
  print(fruits);
  fruits.removeAt(3);
  print(fruits);
  fruits.clear();
  print(fruits);

  const colours = ['Blue', 'Orange', ''];
//   colours.add('Pink');
//   colours = [];
  colours[2] = 'Pink';
  print(colours);
}

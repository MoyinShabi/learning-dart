void main() {
  var setName1 = <String>{}; //An empty set must be specified this way
  print(setName1);
  Set<String> setName2 = {};
  print(setName2);
  var fruits = {'Orange', 'Apple', 'Mango'};

  //Basic methods
  fruits.add('Banana');
  print(fruits);
  fruits.addAll({'Avocado', 'Grape', 'Apple'});
  print(fruits);
  print(fruits.elementAt(2)); //Mango
  fruits.remove('Mango');
  print(fruits);
  fruits.removeAll({'Grape', 'Apple'});
  print(fruits);
  print(fruits.contains('Orange'));
  print(fruits.containsAll({'Orange', 'Pawpaw'}));

  //Basic properties
  print(fruits.first);
  print(fruits.last);
  print(fruits.length);
  print(fruits.isEmpty);
  print(fruits.isNotEmpty);

  //Basic operations
  var euCountries = {'Italy', 'UK', 'Russia'};
  var asianCountries = {'India', 'China', 'Russia'};
  print(euCountries.union(asianCountries));
  print(euCountries.intersection(asianCountries));
  print(euCountries.difference(asianCountries));
  print(asianCountries.difference(euCountries));

  for (var country in euCountries) {
    print(country);
  }
}

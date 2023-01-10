void main() {
  var fruits = <String>['Orange', 'Apple', 'Mango', 'Pineapple'];
  //basic properties
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

  //basic methods
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
}

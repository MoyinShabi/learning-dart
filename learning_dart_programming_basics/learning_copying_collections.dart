void main() {
  final list = [
    1,
    2,
    3
  ]; //List variable with a reference to the location in memory that contains these values.
  final copy1 =
      list; //Not a copy of the values but a new reference pointing to the same location of the collection in memory.
  copy1[0] = 0; //
  print('list: $list'); //list: [0, 2, 3]
  print('copy1: $copy1'); //copy1: [0, 2, 3]

  //To make an actual copy of the values:
  final copy2 = [
    ...list
  ]; //Using the spread operator to create a new collection which is a copy of what's inside `list`. Dart will allocate a new portion of memory for this new list.
  copy2[0] = 4;
  print('copy2: $copy2'); //copy2: [4, 2, 3]

  //Note: There are other ways of copying collections in Dart
}

void main() {
  /* ## Exercise: Sets

Given two integer sets `a` and `b`, write a program to calculate the set of the elements that belong to either `a` or `b`, but not both.

For example, given the following:

```dart
const a = { 1, 3 };
const b = { 3, 5 };
```

The program should print `{1, 5}`.

Then, calculate and print the sum of all the items in the resulting set.
*/

  const a = <int>{1, 3};
  const b = <int>{3, 5};

  var diffA = a.difference(b);
  var diffB = b.difference(a);

  // print(diffA);
  // print(diffB);

  var union = diffA.union(diffB);
  print(union); //{1, 5}

  //OR
  final c = a.union(b).difference(a.intersection(b));
//Set of items that don't belong to both sets= Set of items that don't belong to the intersection of a and b = Union of a and b minus Intersection of a and b
  print(c); //{1, 5}

  var sum = 0;
  for (var item in union) {
    //OR for (var item in c)
    sum = sum + item;
  }
  print(
      "The sum of all the items in the resulting set is $sum"); //The sum of all the items in the resulting set is 6
}
